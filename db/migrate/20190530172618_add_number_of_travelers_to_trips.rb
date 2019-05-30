class AddNumberOfTravelersToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :number_travelers, :integer
  end
end
