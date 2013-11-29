class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:sucess] = "Welcome to YoYo Burger!"
			redirect_to @user

		else
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name,:last_name, :email, :password,
			:password_confirmation,:phone_no)
	end
end