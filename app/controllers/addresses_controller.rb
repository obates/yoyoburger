class AddressesController < ApplicationController
	before_action :correct_user
	skip_before_action :correct_user, only: [:new, :create]


	def create
		@address = current_user.addresses.build(address_params)

		if @address.save
			flash[:success] = "Address saved!"
			redirect_back_or @address.user
		else
			flash[:danger] = "Unable to save address"
			render @user
		end
	end

	def show

	end

	def new
		@addresses = current_user.addresses.build
	end

	def destroy
		Address.find(params[:id]).destroy
		flash[:success] = "Address sucesfully deleted"
		redirect_back_or @user
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])

		if @address.update_attributes(address_params)
			flash[:success] = "Address Updated"
			redirect_back_or @address.user
		else
			render 'edit'
		end

	end

	private

	def address_params
		params.require(:address).permit(:house_name,:first_line,:area,:city,:postcode)
	end

	def correct_user

			@address = Address.find_by_id(params[:id])

			if @address
				if !(current_user?(@address.user))
					flash[:danger] = "Access denied, details logged."
					redirect_back_or signin_url
				end
			else
				flash[:danger] = "Address doesn't exist"
				redirect_back_or root_url

		end



	end
end

