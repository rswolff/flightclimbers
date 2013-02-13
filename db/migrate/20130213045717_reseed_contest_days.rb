class ReseedContestDays < ActiveRecord::Migration
  def up

    add_column :contestant_days, :contestant_week_id, :integer

    ContestantDay.delete_all
    ContestantWeek.delete_all

    Contest.all.each do |contest| 
      contest.contestants.all.each do |contestant|
        contestant.initialize_contestant_weeks
      end
    end

    remove_column :contestant_days, :day_id
  end

  def down
    # add_column :contestant_days, :day_id, :integer
    remove_column :contestant_days, :contestant_week_id
    ContestantDay.delete_all
    ContestantWeek.delete_all
  end
end
