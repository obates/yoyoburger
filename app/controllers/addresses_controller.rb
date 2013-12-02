class AddressesController < ApplicationController
	before_action :signed_in_user, only: [:update,:destroy,:edit]

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

	def destroy

	end

	def edit

	end

	def update

	end

	private
		def address_params
			params.require(:address).permit(:house_name,:first_line,:area,:city,:postcode)
		end
end

