class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@addresses = @user.addresses.all
	end

	def new
		@user = User.new
		@user.addresses = Address.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to YoYo Burger!"
			redirect_to @user

		else
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name,:last_name, :email, :password,
			:password_confirmation,:phone_no,:house_name,:first_line,:area,:city,:postcode,
			address_attributes:[:id,:house_name,:first_line,:area,:city,:postcode])
	end
end