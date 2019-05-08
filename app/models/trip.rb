class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  ##function to iterate over each trip and create an object with the destination details
  def get_trip_details
    temps = self.destination.fetchAnnualTemps

    trip_detail = {
      trip_id: self.id,
      trip_start: self.trip_start,
      trip_end: self.trip_end,
      destination: {
        street_number: self.destination.street_number,
        street_name: self.destination.street_name,
        city: self.destination.city,
        state: self.destination.state,
        country: self.destination.country,
        postal_code: self.destination.postal_code,
        avg_monthly_temperature: temps
      }
    }
    trip_detail
  end

  ##calls trip details on all trips
  def self.get_all_trip_details
    trips = []
    Trip.all.map{|trip|trips.push(trip.get_trip_details)}
    return trips
  end

  #retreives top hotels from hotels.com based on specific parameters
  def self.get_hotel_data
    trips_hotel_data = []
    Trip.all.map do |trip|
      trips_hotel_data.push(trip.destination.fetchHotelData)
    end
    trips_hotel_data
  end

  def self.get_activity_data
    trips_activity_data = []
    Trip.all.map do |trip|
      trips_activity_data.push(trip.destination.fetchTopGoogleSearchResults)
    end
    trips_activity_data
  end

end
