class AddWeeksToContest < ActiveRecord::Migration
  def change
    add_column :contests, :number_of_weeks, :integer
  end
end
