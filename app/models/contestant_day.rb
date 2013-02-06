class ContestantDay < ActiveRecord::Base
  attr_accessible :contestant_id, :day_id, :down_flights, :down_flights_extended_value, :total_flights, :total_flights_extended_value, :up_flights, :up_flights_extended_value

  belongs_to :contestant
  belongs_to :day

  def self.get(day_id, contestant_id)
    ContestantDay.where("day_id = ? AND contestant_id = ?", day_id, contestant_id).first    
  end

end
