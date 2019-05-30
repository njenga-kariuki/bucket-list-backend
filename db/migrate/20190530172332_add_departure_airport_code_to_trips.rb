class AddDepartureAirportCodeToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :departure_airport_code, :string
  end
end
