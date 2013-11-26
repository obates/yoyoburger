require 'spec_helper'

describe "StaticPages" do
  
	describe "Home page" do

		it "should have the content 'YoYo Burger'" do
		  visit '/static_pages/home'
		  expect(page).to have_content('YoYo Burger')
		end

		  it "should have the title 'YoYo Burger | Home'" do
		  visit '/static_pages/home'
		  expect(page).to have_title("YoYo Burger | Home")
    end

	end

end
