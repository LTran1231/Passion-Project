

get '/posts/:id/new' do
  user = User.where(id: params[:id]).first
  if user == current_user
    erb :"/posts/new"
  end
end

post '/posts/:id/new' do
  user = User.find(params[:id])
  city = City.find_or_create(city: params[:city])
  country = Country.find_or_create(country: params[:country])
  new_post = user.posts.new(params[:post].merge!(city_id: city.id).merge!(country_id: country.id))
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
  city = City.find_or_create(city: params[:city])
  post.update(params[:post].merge!(city_id: city.id))

  redirect "/profile/#{current_user.id}"
end

