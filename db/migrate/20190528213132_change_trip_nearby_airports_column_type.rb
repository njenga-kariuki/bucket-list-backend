class ChangeTripNearbyAirportsColumnType < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :direct_flights

    add_column :trips,  :direct_flights, :string, array:true, :default=>[]
  end
end
