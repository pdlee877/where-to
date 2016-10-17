post '/destinations' do
	# @user_input = Destination.new(name: params[:destination])
		@location = Destination.find_or_create_by(name: params[:destination])
		
		redirect "/destinations/#{@location.id}"
end


get '/destinations/:destination_id' do
	@location = Destination.find(params[:destination_id])
	@destination = GooglePlacesApiAdapter.find_location(@location.name)
	@latitude = GooglePlacesApiAdapter.get_latitude(@location.name)
	@longitude = GooglePlacesApiAdapter.get_longitude(@location.name)

	@food = GooglePlacesApiAdapter.nearby_restaurants(@latitude, @longitude)
	@things = GooglePlacesApiAdapter.things_to_do(@location.name)
	erb :'destinations/index'
end

get '/destinations/:destination_id/restaurants' do
	@location = Destination.find(params[:destination_id])
	@destination = GooglePlacesApiAdapter.find_location(@location.name)
	@latitude = GooglePlacesApiAdapter.get_latitude(@location.name)
	@longitude = GooglePlacesApiAdapter.get_longitude(@location.name)
	@food = GooglePlacesApiAdapter.nearby_restaurants(@latitude, @longitude)
	erb :'restaurants/index'
end

get '/destinations/:destination_id/things-to-do' do
	@destination = Destination.find(params[:destination_id])
	@location = GooglePlacesApiAdapter.find_location(@destination.name)
	@things = GooglePlacesApiAdapter.things_to_do(@destination.name)

	erb :'things-to-do/index'
end



get '/destinations' do
	erb :'destinations/index'
end
