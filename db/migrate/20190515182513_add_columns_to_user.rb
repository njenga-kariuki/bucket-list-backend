class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :preffered_hotel_2, :string
    add_column :users, :preffered_airline_1, :string
  end
end
