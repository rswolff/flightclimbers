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

  def self.average_number_of_flights_up(contest, day_ids)
    Measurement.select(["SUM(number_of_flights) as sum_number_of_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).up.first.sum_number_of_flights / contest.contestants.count
  end

  def self.average_number_of_flights_down(contest, day_ids)
    Measurement.select(["SUM(number_of_flights) as sum_number_of_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).down.first.sum_number_of_flights / contest.contestants.count
  end

  def self.average_number_of_flights_total(contest, day_ids)
    Measurement.select(["SUM(extended_value) as sum_extended_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).first.sum_extended_flights / contest.contestants.count
  end

  def self.average_extended_value_up(contest, day_ids)
    Measurement.select(["SUM(extended_value) as sum_extended_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).up.first.sum_extended_flights / contest.contestants.count
  end

  def self.average_extended_value_down(contest, day_ids)
    Measurement.select(["SUM(extended_value) as sum_extended_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).down.first.sum_extended_flights / contest.contestants.count
  end

  def self.average_extended_value_total(contest, day_ids)
    Measurement.select(["SUM(extended_value) as sum_extended_flights"]).where(:day_id => day_ids).where(:user_id => contest.contestant_ids).first.sum_extended_flights / contest.contestants.count
  end

  def calculate_averages

    self.average_number_of_flights_up = ContestWeek.average_number_of_flights_up(self.contest, self.day_ids)
    self.average_number_of_flights_down = ContestWeek.average_number_of_flights_down(self.contest,self.day_ids)
    self.average_number_of_flights_total = ContestWeek.average_number_of_flights_total(self.contest,self.day_ids)
    self.average_extended_value_up = ContestWeek.average_extended_value_up(self.contest,self.day_ids)
    self.average_extended_value_down = ContestWeek.average_extended_value_down(self.contest,self.day_ids)
    self.average_extended_value_total = ContestWeek.average_extended_value_total(self.contest,self.day_ids)

    save
  end

  def max_up_contestant
    Measurement.select("SUM(extended_value) as sum_extended_value, user_id").where(day_id: self.day_ids).where(direction: 'up').group(:user_id).order("sum_extended_value DESC").limit(1).first
  end  

  def max_down_contestant
    Measurement.select("SUM(extended_value) as sum_extended_value, user_id").where(day_id: self.day_ids).where(direction: 'down').group(:user_id).order("sum_extended_value DESC").limit(1).first
  end

  def max_total_contestant
    Measurement.select("SUM(extended_value) as sum_extended_value, user_id").where(day_id: self.day_ids).group(:user_id).order("sum_extended_value DESC").limit(1).first
  end

end
