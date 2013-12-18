class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.integer :spice_level
      t.float :price

      t.timestamps
    end
  end
end
