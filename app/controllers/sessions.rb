## LOGIN/LOGOUT
get '/signin' do
	erb :"sessions/signin"
end

post '/signin' do
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/'
	else
		@errors = "Invalid email/password."
		erb :"sessions/signin"
	end
end

get '/signout' do
	session[:user_id] = nil
	redirect '/'
end



## SIGN UP
get '/signup' do
	erb :"sessions/signup"
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect '/'
	else
		@errors = @user.errors.full_messages
		erb :"sessions/signup"
	end
end

## SIGNUP WITH FACEBOOK
get '/facebook' do
	redirect Facebook.authorization_url
end

get '/oauth' do
	p access_token = Facebook.get_access_token(params["code"])
	p "*" * 100
  p user = User.create_from_facebook(access_token)
  p "l" *100
  session[:user_id] = user.id
  redirect "/profile/#{user.id}"
end









