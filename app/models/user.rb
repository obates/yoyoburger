class User < ActiveRecord::Base

	has_many :addresses,dependent: :destroy
	accepts_nested_attributes_for :addresses, :allow_destroy => true

	before_save{self.email = email.downcase}
	before_create :create_remember_token


	validates :first_name,presence:true, length:{maximum:30}

	validates :last_name,presence:true, length:{maximum:30}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email,presence:true, length:{maximum:50}, format:{with:VALID_EMAIL_REGEX},
	uniqueness:{case_sensitive:false}


	validates :phone_no,presence:true

	has_secure_password

	validates :password, length:{minimum:6}

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end
