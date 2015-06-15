get '/posts/:id/new' do
  user = User.where(id: params[:id]).first
  if user == current_user
    erb :"/posts/new"
  end
end

post '/posts/:id/new' do
  user = User.find(params[:id])
  pin = Pin.find_or_create_by(params[:pin])
  new_post = user.posts.new(params[:post].merge!(pin_id: pin.id))
  if new_post.save
  	redirect "/profile/#{current_user.id}"
  else
  	@errors = new_post.errors.full_messages
  	erb :"/posts/new"
  end
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])


  erb :"/posts/edit"
end

put '/posts/:id/edit' do
	post = Post.find(params[:id])
  pin = Pin.find_or_create_by(params[:pin])
  post.update(params[:post].merge!(pin_id: pin.id)) 

  redirect "/profile/#{current_user.id}"
end

