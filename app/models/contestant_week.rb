class ContestantWeek < ActiveRecord::Base
  attr_accessible :contest_week_id, :contestant_id, :down_flights, :down_flights_extended_value, :total_flights, :total_flights_extended_value, :up_flights, :up_flights_extended_value
  belongs_to :contestant 
  belongs_to :contest_week
  has_many :contestant_days

  after_create :initialize_contestant_days 

  def self.get(contest_week, contestant)
    ContestantWeek.where("contest_week_id =? AND contestant_id = ?", contest_week.id, contestant.id).first    
  end

  def initialize_contestant_days
		
  	contestant = Contestant.find(self.contestant_id)
		contest_week = ContestWeek.find(self.contest_week_id)

		(contest_week.start_date..contest_week.end_date).each do |contestant_week_day|
			contest_day = ContestDay.joins(:day).where(["days.date = ?", contestant_week_day]).first
			ContestantDay.create(contestant_id: contestant.id , contestant_week_id: self.id , contest_day_id: contest_day.id , contest_week_id: contest_week.id)
		end

	end

  def day_ids
    self.contestant_days.joins(:contest_day => :day).pluck(:day_id)
  end

  def contestant_day_ids
    self.contestant_days.pluck(:id)
  end

end
