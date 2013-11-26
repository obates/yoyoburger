require 'spec_helper'

describe "StaticPages" do
  
	describe "Home page" do

		it "should have the content 'YoYo Burger'" do
		  visit '/static_pages/home'
		  expect(page).to have_content('YoYo Burger')
		end

	end

end
