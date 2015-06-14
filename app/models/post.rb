class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  belongs_to :pin

  validates :title, :pin_id, presence: true

  def sort_posts_by_date(posts)
  	posts.all.order(created_at: :DESC) 
  end

end
