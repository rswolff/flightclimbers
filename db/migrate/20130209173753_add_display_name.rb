class AddDisplayName < ActiveRecord::Migration
  def up
  	add_column :users, :display_name, :string
  end

  def down
  	remove_column :users, :display_name, :string
  end
end
