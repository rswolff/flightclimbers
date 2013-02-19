class AddAveragesToContestWeek < ActiveRecord::Migration
  def change
  	add_column :contest_weeks, :average_number_of_flights_up, :integer, :default => 0
  	add_column :contest_weeks, :average_extended_value_up, :decimal, :precision => 10, :scale => 2, :default => 0.0
  	add_column :contest_weeks, :average_number_of_flights_down, :integer, :default => 0
  	add_column :contest_weeks, :average_extended_value_down, :decimal, :precision => 10, :scale => 2, :default => 0.0
  	add_column :contest_weeks, :average_number_of_flights_total, :integer, :default => 0
  	add_column :contest_weeks, :average_extended_value_total, :decimal, :precision => 10, :scale => 2, :default => 0.0
  end
end
