## LOGIN/LOGOUT
get '/login' do
	erb :"/sessions/login"
end

post '/login' do
	user = User.find_by(email: params[:email])
	if user && user.authenticate == params[:password]
		session[:user_id] = user.id
		redirect '/' 
	else
		@errors = "Invalid email/password."
		erb :"/sessions/login"
	end
end


## SIGN UP
get '/signup' do
  "Hello World"
end