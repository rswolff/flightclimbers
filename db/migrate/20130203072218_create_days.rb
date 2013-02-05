class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date
      t.integer :day
      t.integer :month
      t.integer :year
      t.integer :cwday
      t.integer :cweek
      t.integer :yday

      t.timestamps
    end
  end
end
