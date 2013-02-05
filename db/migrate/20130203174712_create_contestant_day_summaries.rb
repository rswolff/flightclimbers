class CreateContestantDaySummaries < ActiveRecord::Migration
  def change
    create_table :contestant_days do |t|
      t.integer :contestant_id
      t.integer :day_id
      t.integer :up_flights, :default => 0
      t.decimal :up_flights_extended_value, :default => 0.0, :precision => 10, :scale => 2
      t.integer :down_flights, :default => 0
      t.decimal :down_flights_extended_value, :default => 0.0, :precision => 10, :scale => 2
      t.integer :total_flights, :default => 0
      t.decimal :total_flights_extended_value, :default => 0.0, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
