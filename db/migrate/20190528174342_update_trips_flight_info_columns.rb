class UpdateTripsFlightInfoColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :flight_info

    add_column :trips,  :nearby_airports, :string, array:true, :default=>[]
    add_column :trips, :flight_distance, :string
    add_column :trips, :flight_time, :string
    add_column :trips, :time_zone_difference, :string
    add_column :trips, :direct_flights, :string
  end
end
