class ContestWeek < ActiveRecord::Base
  
  attr_accessible :contest_id, :contest_week, :start_date, :end_date, :day_id
  has_many :contest_days
  has_many :contestant_weeks
  has_many :contestant_days
  belongs_to :contest
  belongs_to :contestant, :foreign_key => 'user_id'

  after_create :initialize_contest_days

  scope :up, where(direction: 'up')
  scope :down, where(direction: 'down')

  def initialize_contest_days
  	(self.start_date..self.end_date).each do |contest_day|
  		day = Day.where(date: contest_day).first
  		ContestDay.create(contest_id: self.contest_id, contest_week_id: self.id, day_id: day.id)
  	end
  end

  def day_ids
    days = contest_days.pluck(:day_id)
  end

  #TODO: check to see if this method can be deleted
  def contestant_up_flights(contestant)
    contestant.measurements.where(:day_id => (self.contest_days.pluck(:day_id))).where("measurements.direction = 'up'")
  end

  def average_number_of_flights_up
    Measurement.select(["SUM(number_of_flights) as sum_number_of_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).up.first.sum_number_of_flights / contest.contestants.count
  end

  def average_number_of_flights_down
    Measurement.select(["SUM(number_of_flights) as sum_number_of_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).down.first.sum_number_of_flights / contest.contestants.count
  end

  def average_extended_value_up
    Measurement.select(["SUM(extended_value) as sum_extended_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).up.first.sum_extended_flights / contest.contestants.count
  end

  def average_extended_value_down
    Measurement.select(["SUM(extended_value) as sum_extended_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).down.first.sum_extended_flights / contest.contestants.count
  end

  private
  def calculate_averages
    average_number_of_flights_up
    average_number_of_flights_down
    average_extended_value_up
    average_extended_value_down
  end  

end
