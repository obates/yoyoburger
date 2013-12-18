class ChangePriceToFloat < ActiveRecord::Migration
  def change
  	change_column :menu_items,:price,:float
  end
end
