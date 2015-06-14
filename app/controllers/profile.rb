
# show user posts

# show current_user profile
get '/profile/:name' do
  @user = User.find_by(name: params[:name])
  erb :"/profile/show"
end

get '/profile/:name/edit' do
  @user = User.find_by(name: params[:name])
  erb :"/profile/edit"
end

put '/profile/:name/edit' do
  current_user.update(params[:user])
  redirect "/profile/#{current_user.name}"
end

# create post
# see post


