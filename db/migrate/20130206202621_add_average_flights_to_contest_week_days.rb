class AddAverageFlightsToContestWeekDays < ActiveRecord::Migration
  def change
    add_column :contest_week_days, :average_up_flights, 		:integer, :default => 0
    add_column :contest_week_days, :average_down_flights, 	:integer, :default => 0
    add_column :contest_week_days, :average_total_flights, 	:integer, :default => 0
    add_column :contest_week_days, :average_up_flights_extended_value, 			:decimal, :default => 0.0, :precision => 10, :scale => 2
    add_column :contest_week_days, :average_down_flights_extended_value, 		:decimal, :default => 0.0, :precision => 10, :scale => 2
    add_column :contest_week_days, :average_total_flights_extended_value, 	:decimal, :default => 0.0, :precision => 10, :scale => 2
  end
end
