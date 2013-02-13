class ContestantDay < ActiveRecord::Base
  attr_accessible :contestant_id, :down_flights, :down_flights_extended_value, :total_flights, :total_flights_extended_value, :up_flights, :up_flights_extended_value, :contest_day_id, :contest_week_id, :contestant_week_id

  belongs_to :contestant
  belongs_to :contest_day
  belongs_to :contest_week

  def self.get(contest_day, contestant)
    ContestantDay.where("contest_day_id = ? AND contestant_id = ?", contest_day.id, contestant.id).first    
  end

end
