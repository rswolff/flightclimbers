class CreateContestWeekDays < ActiveRecord::Migration
  def change
    create_table :contest_week_days do |t|
      t.integer :contest_id
      t.integer :contest_week_id
      t.integer :day_id

      t.timestamps
    end
  end
end
