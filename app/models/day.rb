class Day < ActiveRecord::Base
  attr_accessible :cwday, :cweek, :date, :day, :month, :yday, :year
  has_many :measurements
  belongs_to :contest_day

  # Measurement.select("SUM(extended_value) number_of_flights").where(user_id: 10, id: ContestWeek.where(contest_week: 1).pluck(:day_id)).first
end
