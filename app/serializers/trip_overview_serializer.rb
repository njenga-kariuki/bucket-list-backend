class TripOverviewSerializer < ActiveModel::Serializer
  attributes :id, :trip_start, :trip_end, :trip_notes, :flight_summary, :destination_data
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
      hotel_data: self.object.destination.fetchHotelData
    }
  end

  def flight_summary
    {
      flight_distance: self.object.flight_distance,
      flight_time: self.object.flight_time,
      time_zone_difference: self.object.time_zone_difference,
      nearby_airports: self.object.nearby_airports,
      direct_flights: self.object.direct_flights
    }
  end

  def trip_notes
    tripNotesObj = []
    self.object.trip_notes.each do |note|
      noteObj = {
        id: note.user.id,
        note_text: note.note,
        date_created: note.created_at,
        first_name: note.user.first_name,
        last_name: note.user.last_name
      }
      tripNotesObj << noteObj
    end
    return tripNotesObj
  end
end
