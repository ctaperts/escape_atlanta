module LocationsHelper
  #grab all buses from MARTA api, and decide which are close to the user
  def fetch_buses_from_api(source_url)
    # gets the entire HTTP message
    http = Net::HTTP.get_response(URI.parse(source_url))
    # split out the body
    data = http.body
    JSON.parse(data)
  end

  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    #Maximum distance in degrees
    max_distance = 0.01

    difference_latitudes = user_lat - bus_lat.to_f 
    difference_longitues = user_long - bus_long.to_f

    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitues ** 2)

    distance <= max_distance

  end
end
