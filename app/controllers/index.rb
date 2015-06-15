get '/' do
	erb :"/posts/search"
end

post '/search' do
	@search_city = Pin.where(city: params[:city]).first
	@search_country = Pin.where(country: params[:country]).first
	if @search_city || @search_country 
	redirect "/"
else
	@errors = "There is no post on the location you are searching."
	erb :index
end
end

# post '/cheers' do
#   @sign_text = params[:cheer_name]
#   redirect "/?sign_text=#{Mascot.sign_for(@sign_text)}"
# end