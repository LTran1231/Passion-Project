get '/posts/:id/new' do
  user = User.where(id: params[:id]).first
  if user == current_user
    erb :"/posts/new"
  end
end

post '/posts/:id/new' do
  user = User.find(params[:id])
  pin = params[:pin]
  user.posts.new(params[:post], params[pin])
  user.save


end
