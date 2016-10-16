class GooglePlacesApiAdapter
	include HTTParty

	def self.nearby_restaurants(latitude, longitude)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=500&type=restaurant&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		p response
		# p '*' * 50

		# pictures = body['photos']
		# name = body['name']
		# icon = body['icon']
		# hours = body['opening_hours']
		# priceing = body['price_level']
		# rating = body['rating']
	end

	# make a search box within the map to input the output of the activity
	def self.things_to_do(input_location_for_activities)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/place/textsearch/xml?query=things+to+do+#{input_location_for_activities}&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		p '*' * 50
		body = response['PlaceSearchResponse']['result']
		p body
		# need to iterate through the result hash to get the different activity places
	end

	def self.find_location(location)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		# p self
		# p '*' * 50
		# p response.parsed_response['results'][0]['formatted_address']
		body = response.parsed_response
		# # p '*' * 50
		location_name = body['results'][0]['formatted_address']
		latitude = body['results'][0]['geometry']['location']['lat']
		longitude = body['results'][0]['geometry']['location']['lng']
		# p '*' * 50

		# self.nearby_restaurants(latitude, longitude)
		# p location_name
		# p '*' * 50
		# data = JSON.parse(response) #BECAUSE IT'S ALREADY PARSED
		# p '^' * 50
		# p data
		# p '^' * 50
		# be able to pass the latitude and longitude of location to nearby_restaurants
		# p GooglePlacesApiAdapter.nearby_restaurants(latitude, longitude)
		# p GooglePlacesApiAdapter.things_to_do(location)
		p body
	end

	def self.get_latitude(location)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		latitude = body['results'][0]['geometry']['location']['lat']
	end

	def self.get_longitude(location)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		longitude = body['results'][0]['geometry']['location']['lng']
	end

end