class AddCategoriesToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :category, :integer
  end
end
