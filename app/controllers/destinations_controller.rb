post '/destinations' do
	# @user_input = Destination.new(name: params[:destination])
		@location = Destination.find_or_create_by(name: params[:destination])
		@location.user_id = current_user.id
		redirect "/destinations/#{@location.id}"
end


get '/destinations/:destination_id' do
	@location = Destination.find(params[:destination_id])
	@destination = GooglePlacesApiAdapter.find_location(@location.name)
	@latitude = GooglePlacesApiAdapter.get_latitude(@location.name)
	@longitude = GooglePlacesApiAdapter.get_longitude(@location.name)

	# @food = GooglePlacesApiAdapter.nearby_restaurants(@latitude, @longitude)
	# @things = GooglePlacesApiAdapter.things_to_do(@location.name)
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
	@location = Destination.find(params[:destination_id])
	@destination = GooglePlacesApiAdapter.find_location(@location.name)
	@things = GooglePlacesApiAdapter.things_to_do(@location.name)

	erb :'things-to-do/index'
end


get '/destinations' do
	erb :'destinations/index'
end

post '/destinations/:destination_id/users' do
	Destination.find(params[:destination_id]).users << current_user
	redirect "/users/#{current_user.id}"
end

delete '/destinations/:destination_id/users/:user_id' do

end

