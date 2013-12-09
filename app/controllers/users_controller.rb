class UsersController < ApplicationController

	before_action :correct_user
	skip_before_action :correct_user, only: [:new, :create]

	def show
		@user = User.find(params[:id])
		@addresses = @user.addresses.all
	end

	def new
		@user = User.new
		@user.addresses.build
	end

	def edit

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
			:addresses_attributes => [:user_id,:house_name,:first_line,:area,:city,:postcode])
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	def correct_user
		@user = User.find_by_id(params[:id])

		if @user
			if !(current_user?(@user))
				flash[:danger] = "Access denied"
				redirect_back_or signin_url
			end
		else
			flash[:danger] = "User doesn't exist"
			redirect_back_or root_url
		end
	end
end