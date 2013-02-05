class CreateUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :contest_id
      t.boolean :registration_fee_paid
      t.boolean :accept_terms
    end
  end
end
