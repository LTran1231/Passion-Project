get '/post/:name/new' do
  user = User.where(name: params[:name]).first
  if user == current_user
    erb :"/posts/new"
  end
end

post '/post/:name/new' do
  "hello"
end
