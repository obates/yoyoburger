class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :add1
      t.string :add2
      t.string :city
      t.string :postcode
      t.string :phone_no

      t.timestamps
    end
  end
end
