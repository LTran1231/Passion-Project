class Country < ActiveRecord::Base
	has_many :posts

	before_save { country.downcase! }

	validates :country, presence: true

	def self.find_or_create(attributes)
		self.where(attributes).first || self.create(attributes)
	end

end
