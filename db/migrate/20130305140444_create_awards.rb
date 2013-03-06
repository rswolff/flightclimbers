class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :contestant_id
      t.integer :badge_id
      t.integer :contestable_id
      t.string :contestable_type

      t.timestamps
    end
  end
end
