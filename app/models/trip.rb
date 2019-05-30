class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  has_many :trip_notes
  after_create :get_flight_summary

  #scrapes flight summary info from travelmath.com and saves to db as array
  def get_flight_summary
    flight_info = [{}]
    departure_city = self.departure_location || self.user.default_departure_city

    departure_city.split(" ").length > 1 ? url_departure = departure_city.split(" ").join("+,") : url_departure = departure_city

    url_arrival = self.destination.getCombinedDestinationValue.split(" ").join("+,")

    mechanize = Mechanize.new

    page = mechanize.get("https://www.travelmath.com/from/#{url_departure}/to/#{url_arrival}")

    ##get table with flight information
    data_table = page.search('table')[1]

    data_table.search('tr').slice(0,6).each do |tr|
        cells = tr.search('th, td')
        flight_info[0][cells[0].text] = cells[1].text unless cells[0].text == "Book a Flight"
    end

    #formulate nearby airport a nested array
    flight_info[0]["Airports near Destination"] = flight_info[0]["Airports near Destination"].split("\n") unless !flight_info[0]["Airports near Destination"]

    #formulate nearby airport a nested array
    flight_info[0]["Direct Flights"] = flight_info[0]["Direct Flights"].split("\n") unless !flight_info[0]["Direct Flights"]

    self.flight_distance = flight_info[0]["Flight Distance"] || nil
    self.flight_time = flight_info[0]["Flight Time"] || nil
    self.time_zone_difference = flight_info[0]["Time Difference"] || nil
    self.nearby_airports= flight_info[0]["Airports near Destination"] || nil
    self.direct_flights = flight_info[0]["Direct Flights"] || nil
    self.save
  end

end
