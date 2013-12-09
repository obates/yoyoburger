class MenuItem < ActiveRecord::Base

	validates :name, presence:true, length:{maximum: 30}
	validates :description, presence:true, length:{maximum: 400}
	validates :spice_level, presence:true
	validates :price, presence:true, numericality:{greater_than: 0}

end
