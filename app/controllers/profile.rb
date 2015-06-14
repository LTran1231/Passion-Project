
# show user posts

# show current_user profile
get '/profile/:name' do
  @user = User.find_by(name: params[:name])
  erb :"/profile/show"
end

get '/profile/:name/edit' do
    erb :"/profile/edit"
end

post '/profile/:name/edit' do
  "Hello World"
end

# create post
# see post


