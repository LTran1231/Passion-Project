helpers do 

  # return the current user, if they exist

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end
		
	#looged_in? is true if current user is not nil
	def logged_in?
		!current_user.nil?
	end
end


