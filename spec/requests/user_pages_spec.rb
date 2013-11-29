require 'spec_helper'

describe "UserPages" do
	subject {page}

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.first_name) }
		it { should have_title('YoYo Burger | ' + user.first_name + ' ' + user.second_name) }
	end

	describe "signup page" do
		before {visit signup_path}

		it{should have_content('Sign up')}
		it{should have_title('YoYo Burger | Sign Up')}
	end

end
