
module Api
  module V1
    class RangesController < ApplicationController

      # GET /api/v1/range
      def show
        start_date = DateTime.parse(params[:start_date].to_s)
        end_date = DateTime.parse(params[:end_date].to_s)

        snapshots_in_range = WeatherSnapshot.where(dateutc: start_date..end_date).order(:dateutc)
        puts "Snapshots in range #{snapshots_in_range.size}"
        render json: snapshots_in_range
      end
    end
  end
end

