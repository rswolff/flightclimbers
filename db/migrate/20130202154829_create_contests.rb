class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.money :registration_fee
      t.float :ascend_value
      t.float :descend_value

      t.timestamps
    end
  end
end
