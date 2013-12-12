class MenuItemsController < ApplicationController


	def new
		@menu_item = MenuItem.new
	end

	def edit
		@menu_items = MenuItem.find(params[:id])
	end

	def update
		@menu_item = MenuItem.find(params[:id])

		if @menu_item.update_attributes(menu_item_params)
			flash[:success] = "Menu Item Updated"
			redirect_back_or @user
		else
			render 'edit'
		end

	end

	def destroy
		MenuItem.find(params[:id]).destroy
		flash[:success] = "Menu item sucesfully deleted"
		redirect_back_or @user
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

	def show

	end

	private

		def menu_item_params
			params.require(:menu_item).permit(:name,:description,:spice_level,:price,:category,:image)
		end
end