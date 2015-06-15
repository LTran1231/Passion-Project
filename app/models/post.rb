class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  belongs_to :pin

  validates :title, :pin_id, presence: true

end
