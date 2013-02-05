class ContestantDay < ActiveRecord::Base
  attr_accessible :contestant_id, :day_id, :down_flights, :down_flights_extended_value, :total_flights, :total_flights_extended_value, :up_flights, :up_flights_extended_value

  belongs_to :contestant
  belongs_to :day

end
