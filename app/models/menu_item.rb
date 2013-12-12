class MenuItem < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	def priceFloat
		@priceFloat = (priceFloat * 100).to_i
	end

	def priceFloat=(price)
		self.price = price
	end

	validates :name, presence:true, length:{maximum: 30}
	validates :description, presence:true, length:{maximum: 400}
	validates :spice_level, presence:true
	validates :price, presence:true, numericality:{greater_than: 0}

end
