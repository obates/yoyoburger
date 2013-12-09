class RemoveAddressFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :add1, :string
    remove_column :users, :add2, :string
    remove_column :users, :city, :string
    remove_column :users, :postcode, :string
  end
end
