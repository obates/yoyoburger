class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :house_name
      t.string :first_line
      t.string :area
      t.string :city
      t.string :postcode

      t.timestamps
    end

    add_index :addresses, [:user_id,:created_at] #could use updated_at to show last address used first?
  end
end
