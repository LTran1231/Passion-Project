helpers do

  # return the current user, if they exist

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	#logged_in? is true if current user is not nil
	# def login(user)
	# 	session[:user_id] = user.id
	# end
end


