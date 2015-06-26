class City < ActiveRecord::Base
  has_many :posts

  before_save { city.downcase! }
  
  validates :city, presence: true

  def find_or_create(attributes)
		self.where(attributes).first || self.create(attributes)
	end

  
end
