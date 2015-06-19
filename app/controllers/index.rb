get '/' do
	erb :index
end



post '/search' do
	p @search_city = City.where(city: params[:city].downcase).first
	p @search_country = Country.where(country: params[:country].downcase).first
	if @search_city || @search_country 
		erb :index, layout: false 
	else
		@error = "There is no post on the location you are searching."
		erb :index, layout: false
	end
end

# post '/cheers' do
#   @sign_text = params[:cheer_name]
#   redirect "/?sign_text=#{Mascot.sign_for(@sign_text)}"
# end