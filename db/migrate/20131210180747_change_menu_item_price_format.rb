class ChangeMenuItemPriceFormat < ActiveRecord::Migration
  def change
  	change_column :menu_items, :price,:integer
  end
end
