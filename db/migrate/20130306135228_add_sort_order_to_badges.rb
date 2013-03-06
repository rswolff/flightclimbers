class AddSortOrderToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :difficulty, :integer
  end
end
