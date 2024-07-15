module Api
  module V1
    class PostsController < ApplicationController
      # For some reason the Ambient Weather gurus decided to make it a get request!? Like who okayed this?
      # GET /api/v1/post
      def show
        weather_snapshot = WeatherSnapshot.new(weather_snapshot_params)

        if weather_snapshot.save
          render json: { message: 'Weather snapshot created successfully', weather_snapshot: weather_snapshot }, status: :created
        else
          render json: { errors: weather_snapshot.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def weather_snapshot_params
        params.permit(
          :stationtype, :PASSKEY, :dateutc, :tempf, :humidity,
          :windspeedmph, :windgustmph, :maxdailygust, :winddir,
          :uv, :solarradiation, :hourlyrainin, :dailyrainin,
          :weeklyrainin, :monthlyrainin, :totalrainin,
          :battout, :tempinf, :humidityin, :baromrelin,
          :baromabsin, :batt_co2
        )
      end
    end
  end
end
