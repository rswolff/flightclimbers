class AddRulesToContest < ActiveRecord::Migration
  def change
    add_column :contests, :rules, :text
  end
end
