class AddAveragesToContestWeek < ActiveRecord::Migration
  def change
  	add_column :contest_weeks, :average_number_of_flights_up, :integer
  	add_column :contest_weeks, :average_extended_value_up, :decimal, :precision => 10, :scale => 2
  	add_column :contest_weeks, :average_number_of_flights_down, :integer
  	add_column :contest_weeks, :average_extended_value_down, :decimal, :precision => 10, :scale => 2
  	add_column :contest_weeks, :average_number_of_flights_total, :integer  	
  	add_column :contest_weeks, :average_extended_value_total, :decimal, :precision => 10, :scale => 2
  end
end
