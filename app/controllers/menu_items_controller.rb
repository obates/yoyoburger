class MenuItemsController < ApplicationController


	def new
		@menu_item = MenuItem.new
	end

	def create
		@menu_item = MenuItem.new(menu_item_params)

		if @menu_item.save
			flash[:success] = "Menu item saved"
			redirect_to menu_items_path
		else
			render 'new'
		end
	end

	def index
		@menu_items = MenuItem.all
	end


	def menu_item_params
		params.require(:menu_item).permit(:name,:description,:spice_level,:price,:category)
	end


end