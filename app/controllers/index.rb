get '/' do
	erb :index
end



post '/search' do
	search_city = City.where(city: params[:city].downcase).first
	search_country = Country.where(country: params[:country].downcase).first
	if search_city || search_country 
		erb :index, locals: { city: search_city, country: search_country }, layout: false
	else
		error = "There is no post on the location you are searching."

	end
end
