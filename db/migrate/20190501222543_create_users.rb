class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :preffered_hotel_1
      t.string :preffered_airline_2
      t.timestamps
    end
  end
end
