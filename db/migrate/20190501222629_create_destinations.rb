class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.string :country
      t.integer :postal_code
      t.timestamps
    end
  end
end
