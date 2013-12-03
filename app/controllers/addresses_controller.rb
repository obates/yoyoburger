class AddressesController < ApplicationController
	#before_action :signed_in_user, only: [:update,:destroy,:edit]

	def create
		# @address = current_user.addresses.build(address_params)

		# if @address.save
		# 	flash[:success] = "Address saved!" #might have to remove this due to conflict with user save
		# 	redirect_to @user #again might hae to remove this
		# else
		# 	flash[:danger] = "Unable to save address"
		# 	render @user
		# end
	end

	def show

	end

	def new
		@user = current_user
		@user.addresses.build
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
			redirect_back_or @user
		else
			render 'edit'
		end

	end

	private
		def address_params
			params.require(:address).permit(:house_name,:first_line,:area,:city,:postcode)
		end
end

