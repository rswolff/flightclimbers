class AddIntervalToBadge < ActiveRecord::Migration
  def change
    add_column :badges, :interval, :string
  end
end
