class TripOverviewSerializer < ActiveModel::Serializer
  attributes :id, :trip_start, :trip_end, :destination_data
  has_one :user

  def destination_data
    {
      street_number: self.object.destination.street_number,
      street_name: self.object.destination.street_name,
      city: self.object.destination.city,
      state: self.object.destination.state,
      country: self.object.destination.country,
      latitude: self.object.destination.latitude,
      longitude: self.object.destination.longitude,
      avg_monthly_temperature: self.object.destination.avg_monthly_temperature,
      hotel_data: self.object.destination.fetchHotelData,
      activity_data: self.object.destination.fetchTopGoogleSearchResults
    }
  end
end


##############MAY NOT NEED THIS
