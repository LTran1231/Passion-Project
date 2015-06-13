## LOGIN/LOGOUT
get '/login' do
	erb :"/sessions/login"
end

post '/login' do
	user = User.find_by(email: params[:email])
	if user && (user.password == params[:password])
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

post '/users/new' do
	@user = User.new(name: params[:name],
									 email: params[:email],
									 password: params[:password],
									 password_confirmation: params[:password_confirmation])
	if @user.save
		current_user
		redirect '/'
	else
		@errors = @user.errors.full_messages
		erb :"/sessions/signup"
	end
end




