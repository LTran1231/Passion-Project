class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :country

  validates :title, :city_id, :country_id, presence: true


end
