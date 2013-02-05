class ContestWeek < ActiveRecord::Base
  
  attr_accessible :contest_id, :contest_week, :start_date, :end_date, :day_id
  has_many :contest_week_days
  has_many :contestant_weeks
  belongs_to :contest

  after_create :initialize_contest_week_days

  def contestant_up_flights(contestant)
  	contestant.measurements.where(:day_id => (self.contest_week_days.pluck(:day_id))).where("measurements.direction = 'up'")
  end

  def initialize_contest_week_days
  	(self.start_date..self.end_date).each do |contest_day|
  		day = Day.where(date: contest_day).first
  		ContestWeekDay.create(contest_id: self.contest_id, contest_week_id: self.id, day_id: day.id)
  	end
  end

end
