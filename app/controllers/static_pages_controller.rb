class StaticPagesController < ApplicationController
	def home
	end

	def about
	end

	def contact
		@contact_form = ContactForm.new
	end

	def menu
		@menu_items = MenuItem.all
	end
end
