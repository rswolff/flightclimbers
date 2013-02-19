class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.integer :contestant_id
      t.text :notes

      t.timestamps
    end
  end
end
