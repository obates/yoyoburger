class CreateDatabas < ActiveRecord::Migration
  def change
    create_table :Users do |t|
    	t.string  :first_name , :limit => 30 , :null => false
    	t.string  :lastname , :limit => 30 , :null => false
    	t.string  :telephone, :limit => 15 , :null => false 
    	t.string  :email ,:limit => 50 , :null => false
    end
    create_table :Adresses do |t|
    	t.belongs_to :Users
    	t.string  :house_name , :limit => 30 , :null => false
    	t.string  :first_line , :limit => 30
    	t.string  :area, :limit => 30 , :null => false 
    	t.string  :city ,:limit => 50 , :null => false
    	t.string  :postcode, :limit => 10 , :null => false
    end
    create_table :Order_History do |t|
    	t.belongs_to :Users
    	t.belongs_to :Orders
    	t.integer        :paid ,:null => false , :default => 0
    	t.timestamp  :time_of_order ,:null => false , :default => Time.now()
    	t.integer		 :delivered, :null => false , :default => 0
    	t.integer    :satisfaction
    end
    create_table :Menu_Item do |t|
    	t.belongs_to :Orders
    	t.string     :name ,:null => false , :default => 'Yummy Burger'
    	t.text       :description ,:null => false
    	t.integer  	 :spice_level 
    	t.integer    :price , :null => false
    end
    create_table :Orders do |t|
    	t.timestamp  :time_of_order ,:null => false , :default => Time.now()
    	t.integer    :menu_item_id  ,:null => false 
    	t.integer    :order_history_id ,:null => false 
    end

  end
end
