class CreateWeatherSnapshots < ActiveRecord::Migration[7.1]
  def change
    create_table :weather_snapshots do |t|
      t.string :stationtype
      t.string :PASSKEY
      t.datetime :dateutc
      t.float :tempf
      t.integer :humidity
      t.float :windspeedmph
      t.float :windgustmph
      t.float :maxdailygust
      t.integer :winddir
      t.integer :uv
      t.float :solarradiation
      t.float :hourlyrainin
      t.float :dailyrainin
      t.float :weeklyrainin
      t.float :monthlyrainin
      t.float :totalrainin
      t.integer :battout
      t.float :tempinf
      t.integer :humidityin
      t.float :baromrelin
      t.float :baromabsin
      t.integer :batt_co2

      t.timestamps
    end
  end
end
