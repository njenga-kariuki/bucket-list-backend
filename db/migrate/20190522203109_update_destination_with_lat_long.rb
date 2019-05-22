class UpdateDestinationWithLatLong < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :latitude, :string
    add_column :destinations, :longitude, :string
  end
end
