class ChangeAscendDescendColumnType < ActiveRecord::Migration
  def up
  	change_column :contests, :ascend_value, :decimal, :precision => 10, :scale => 2
  	change_column :contests, :descend_value, :decimal, :precision => 10, :scale => 2
  	change_column :measurements, :extended_value, :decimal, :precision => 10, :scale => 2
  end

  def down
  	change_column :contests, :ascend_value, :float
  	change_column :contests, :descend_value, :float
  	change_column :measurements, :extended_value, :integer  	
  end
end
