class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :trip_start
      t.string :trip_end
      t.integer :destination_id
      t.integer :user_id
      t.timestamps
    end
  end
end
