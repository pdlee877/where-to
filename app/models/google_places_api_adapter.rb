class GooglePlacesApiAdapter
	include HTTParty

	def self.nearby_restaurants(latitude, longitude)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=500&type=restaurant&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		body = response.parsed_response
	end

	# make a search box within the map to input the output of the activity
	def self.things_to_do(input_location_for_activities)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/place/textsearch/xml?query=things+to+do+#{input_location_for_activities}&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		body = response['PlaceSearchResponse']['result']
		p body
		# need to iterate through the result hash to get the different activity places
	end

	def self.find_location(location)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		body = response.parsed_response
		# location_name = body['results'][0]['formatted_address']
		# latitude = body['results'][0]['geometry']['location']['lat']
		# longitude = body['results'][0]['geometry']['location']['lng']
		# p '*' * 50
	end

	def self.get_latitude(location)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		body = response.parsed_response
		latitude = body['results'][0]['geometry']['location']['lat']
	end

	def self.get_longitude(location)
		mykey = ENV['GOOGLE_MAPS_KEY']
		url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{mykey}"
		format :json
		response = HTTParty.get(url)
		body = response.parsed_response
		longitude = body['results'][0]['geometry']['location']['lng']
	end

end