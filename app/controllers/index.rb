get '/' do
	erb :index
end



post '/search' do
	@search_city = City.where(city: params[:city].downcase).first
	if @search_city
		erb :"search/_result", layout: false, locals: { city: @search_city }
	else
		@error = "There is no post on the location you are searching."
    p @error
	end
end
