get '/' do
	erb :index
end



post '/search' do
	@search_city = City.where(city: params[:city].downcase).first
	if @search_city
		erb :index, locals: { city: @search_city }, layout: false
	else
		@error = "There is no post on the location you are searching."
    erb :index
	end
end
