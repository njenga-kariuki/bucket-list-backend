# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190530172618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.string "street_number"
    t.string "street_name"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avg_monthly_temperature"
    t.string "latitude"
    t.string "longitude"
  end

  create_table "trip_notes", force: :cascade do |t|
    t.string "note"
    t.integer "user_id"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "trip_start"
    t.string "trip_end"
    t.integer "destination_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "departure_location"
    t.string "nearby_airports", default: [], array: true
    t.string "flight_distance"
    t.string "flight_time"
    t.string "time_zone_difference"
    t.string "direct_flights", default: [], array: true
    t.string "departure_airport_code"
    t.integer "number_travelers"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "preffered_hotel_1"
    t.string "preffered_airline_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "preffered_hotel_2"
    t.string "preffered_airline_1"
    t.string "default_airport_code"
    t.string "default_departure_city"
    t.string "preferred_activities", default: [], array: true
    t.string "preferred_accomodations", default: [], array: true
  end

end
