class RefactorContestantDays < ActiveRecord::Migration
  def up
  	add_column :contestant_days, :contest_day_id, :integer
  	add_column :contestant_days, :contest_week_id, :integer
  end

  def down
  	remove_column :contestant_days, :contest_week_id
  	remove_column :contestant_days, :contest_day_id
  end
end
