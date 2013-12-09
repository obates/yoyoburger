class ContactFormsController < ApplicationController
	

	def new
		@contact_form = ContactForm.new
	end

	def create
		begin
			@contact_form = ContactForm.new(params[:contact_form])
			@contact_form.request = request
			if @contact_form.deliver
				flash[:notice] = 'Thank you for your message!'
				redirect_to root_path
			else
				flash.now[:danger] = 'Unsuccessfull sending of message'
				redirect_to contact_path
			end

		rescue ScriptError
			flash[:danger] = 'Sorry, unable to send message please try again later'
		end
	end


	

end