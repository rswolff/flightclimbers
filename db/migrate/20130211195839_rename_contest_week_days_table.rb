class RenameContestWeekDaysTable < ActiveRecord::Migration
  def up
  	rename_table :contest_week_days, :contest_days
  end

  def down
  	rename_table :contest_days, :contest_week_days
  end
end
