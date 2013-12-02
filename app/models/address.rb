class Address < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC')}
	validates :user_id, presence:true

	validates :house_name, presence: true, length:{maximum:30}
	validates :first_line, presence: true, length:{maximum:30}
	validates :area, presence: true, length:{maximum:30}
	validates :city, presence: true, length:{maximum:50}
	validates :postcode, presence: true, length:{maximum:10}
end
