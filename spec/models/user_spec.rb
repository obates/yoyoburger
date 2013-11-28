require 'spec_helper'

describe User do

	before do
	 @user = User.new(first_name: "Oli", second_name: "Bates", email:"olibates@live.com",password:"password",
		password_confirmation:"password",phone_no:"07891919907" )
end

subject { @user }

it { should respond_to(:first_name) }
it { should respond_to(:second_name) }
it { should respond_to(:email) }
it { should respond_to(:password) }
it { should respond_to(:phone_no) }

it {should be_valid}

describe "when password is not present" do
	before do
		@user = User.new(first_name: "Oli", second_name: "Bates", email:"olibates@live.com",password:" ",
			password_confirmation:" ",phone_no:"07891919907" )
		it { should_not be_valid }
	end
end

describe "when password doesn't match confirmation" do
	before { @user.password_confirmation = "mismatch" }
	it { should_not be_valid }
end


describe "when first_name is not present" do
	before { @user.first_name = " " }
	it { should_not be_valid }
end

describe "when first_name is too long" do
	before { @user.first_name = "a" * 31 }
	it { should_not be_valid }
end

describe "when second_name is too long" do
	before { @user.second_name = "a" * 31 }
	it { should_not be_valid }
end

describe "when email is too long" do
	before { @user.email = "a" * 51 }
	it { should_not be_valid }
end


describe "when second_name is not present" do
	before { @user.second_name = " " }
	it { should_not be_valid }
end

describe "when email is not present" do
	before { @user.email = " " }
	it { should_not be_valid }
end

describe "when password is not present" do
	before { @user.password = " " }
	it { should_not be_valid }
end


describe "when phone_no is not present" do
	before { @user.phone_no = " " }
	it { should_not be_valid }
end


describe "when email address is already taken" do
	before do
		user_with_same_email = @user.dup
		user_with_same_email.email = @user.email.upcase
		user_with_same_email.save
	end

	it { should_not be_valid }
end




end
