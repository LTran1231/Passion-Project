## LOGIN/LOGOUT
get '/login' do
	erb :"/sessions/login"
end

post '/login' do
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/'
	else
		@errors = "Invalid email/password."
		erb :"/sessions/login"
	end
end

delete '/sessions/:id' do
	session[:user_id] = nil
	redirect '/'
end


## SIGN UP
get '/signup' do
	erb :"/sessions/signup"
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect '/'
	else
		@errors = @user.errors.full_messages
		erb :"/sessions/signup"
	end
end



