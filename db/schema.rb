# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_03_182811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "weather_snapshots", force: :cascade do |t|
    t.string "stationtype"
    t.string "PASSKEY"
    t.datetime "dateutc"
    t.float "tempf"
    t.integer "humidity"
    t.float "windspeedmph"
    t.float "windgustmph"
    t.float "maxdailygust"
    t.integer "winddir"
    t.integer "uv"
    t.float "solarradiation"
    t.float "hourlyrainin"
    t.float "dailyrainin"
    t.float "weeklyrainin"
    t.float "monthlyrainin"
    t.float "totalrainin"
    t.integer "battout"
    t.float "tempinf"
    t.integer "humidityin"
    t.float "baromrelin"
    t.float "baromabsin"
    t.integer "batt_co2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
