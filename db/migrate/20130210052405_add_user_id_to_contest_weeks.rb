class AddUserIdToContestWeeks < ActiveRecord::Migration
  def change
    add_column :contest_weeks, :user_id, :integer
  end
end
