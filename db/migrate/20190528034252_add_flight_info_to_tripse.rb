class AddFlightInfoToTripse < ActiveRecord::Migration[5.1]
  def change

    add_column :trips,  :flight_info, :string, array:true, :default=>[]
  end
end
