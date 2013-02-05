class CreateContestWeeks < ActiveRecord::Migration
  def change
    create_table :contest_weeks do |t|
      t.integer :contest_id
      t.integer :contest_week
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
