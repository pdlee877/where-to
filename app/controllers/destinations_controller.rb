get '/destinations' do
	erb :'destinations/index'
end

# get '/destinations/:destination_id' do
# end

post '/destinations' do
	# @user_input = Destination.new(name: params[:destination])
		@location = Destination.find_or_create_by(name: params[:destination])
		
		@destination = GooglePlacesApiAdapter.find_location(params[:destination])
		@latitude = @destination['results'][0]['geometry']['location']['lat']
		@longitude = @destination['results'][0]['geometry']['location']['lng']

		@food = GooglePlacesApiAdapter.nearby_restaurants(@lat, @lng)
		@things = GooglePlacesApiAdapter.things_to_do(params[:destination])
		erb :'destinations/index'
end

