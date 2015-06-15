get '/' do
	erb :index
end

post '/search' do
	@search_city = Pin.find_by(city: params[:city])
	@search_country = Pin.find_by(country: params[:country])
	if @search_city || @search_country 
	erb :index
else
	@error = "There is no post on the location you are searching."
	erb :index
end
end

# post '/cheers' do
#   @sign_text = params[:cheer_name]
#   redirect "/?sign_text=#{Mascot.sign_for(@sign_text)}"
# end