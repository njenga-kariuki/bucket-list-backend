class AddDefaultAirportToUserTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :default_airport_code, :string
  end
end
