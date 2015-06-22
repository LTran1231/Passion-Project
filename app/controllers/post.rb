

get '/posts/:id/new' do
  @user = User.where(id: params[:id]).first
  if @user == current_user
    erb :"profile/show", layout: false, locals: { user: @user }

  end
end

post '/posts/:id/new' do
  @user = User.find(params[:id])
  city = City.find_or_create(city: params[:city])
  country = Country.find_or_create(country: params[:country])
  new_post = @user.posts.new(params[:post].merge!(city_id: city.id).merge!(country_id: country.id))
  if new_post.save
    erb :"profile/show", locals: { user: @user }, layout: false
  	# redirect "/profile/#{current_user.id}"
  else
    new_post.errors.full_messages.join("\n")
  end
end

get '/posts/:id/edit' do  
  @user = current_user
  @post = Post.find(params[:id])

  erb :"profile/show", layout: false
    # erb :"/posts/edit"
end

put '/posts/:id/edit' do
	@post = Post.find(params[:id])
  city = City.find_or_create(city: params[:city])
  @post.update(params[:post].merge!(city_id: city.id))

  redirect "/profile/#{current_user.id}"
end

