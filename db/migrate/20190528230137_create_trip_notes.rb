class CreateTripNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_notes do |t|
      t.string :note
      t.integer :user_id
      t.integer :trip_id
      t.timestamps
    end
  end
end
