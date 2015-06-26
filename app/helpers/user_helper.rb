helpers do

  # return the current user, if they exist

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	 def sort_posts_by_date(posts)
  	posts.all.order(created_at: :DESC) 
  end

  def date_count(post)
  	(Time.now - post.updated_at.to_time)/1.day
  end
end


