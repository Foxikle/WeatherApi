module Api
  module V1
    class LatestsController < ApplicationController
      # GET api/v1/latest
      def show
        latest_snapshot = WeatherSnapshot.order(dateutc: :desc).first
        render json: latest_snapshot
      end
    end
  end
end

