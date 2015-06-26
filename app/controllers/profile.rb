
get '/profile/:id' do
	@user = User.where(id: params[:id]).first

	erb :"/profile/show"
end

get '/profile/:id/edit' do
	@user = User.find_by(id: params[:id])
	erb :"/profile/#{current_user.id}", layout: false
end

put '/profile/:id/edit' do

	current_user.update(params[:user])
	@user = current_user

	if request.xhr?
		erb :"profile/show", locals: { user: @user }, layout: false
	else
		redirect "profile/#{current_user.id}"
	end

end

# create post
# see post

 
 