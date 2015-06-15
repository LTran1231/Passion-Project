class Pin < ActiveRecord::Base
  has_many :posts
  before_save { city.downcase! }
  before_save { country.downcase! }
  
end
