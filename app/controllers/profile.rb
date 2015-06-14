
get '/profile/:id' do
  @user = User.where(id: params[:id]).first
  erb :"/profile/show"
end

get '/profile/:id/edit' do
  @user = User.find_by(id: params[:id])
  erb :"/profile/edit"
end

put '/profile/:id/edit' do
  current_user.update(params[:user])
  redirect "/profile/#{current_user.id}"
end

# create post
# see post


