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
	redirect FaceBook.authorization_url
end

get '/oauth' do
	access_token = FaceBook.get_access_token(params["code"])
  user = User.create_from_facebook(access_token)
  redirect "/profile/#{user.id}"
end









