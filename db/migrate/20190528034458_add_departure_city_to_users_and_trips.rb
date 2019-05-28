class AddDepartureCityToUsersAndTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :departure_location, :string
    add_column :users, :default_departure_city, :string
  end
end
