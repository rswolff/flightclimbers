class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :direction
      t.integer :number_of_flights
      t.integer :user_id
      t.integer :day_id
      t.integer :extended_value

      t.timestamps
    end
  end
end
