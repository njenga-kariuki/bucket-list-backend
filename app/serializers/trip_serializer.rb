class TripSerializer < ActiveModel::Serializer
  attributes :id, :trip_start, :trip_end, :destination_data

  def destination_data
    {
      street_number: self.object.destination.street_number,
      street_name: self.object.destination.street_name,
      city: self.object.destination.city,
      state: self.object.destination.state,
      country: self.object.destination.country,
      postal_code: self.object.destination.postal_code
    }
  end
end
