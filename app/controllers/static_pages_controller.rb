class StaticPagesController < ApplicationController
	def home
	end

	def about
	end

	def contact
		@contact_form = ContactForm.new
	end
end
