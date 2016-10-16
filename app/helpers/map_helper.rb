helpers do
	def latitude(location)
		destination = GooglePlacesApiAdapter.find_location(location)
		p destination['results'][0]['geometry']['location']['lat']
	end
end