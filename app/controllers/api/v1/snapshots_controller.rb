module Api
  module V1
    class SnapshotsController < ApplicationController
      # GET /api/v1/snapshot
      def show
        requested_dateutc = DateTime.parse(params[:dateutc].to_s)
        closest_snapshot = WeatherSnapshot.order(Arel.sql("ABS(EXTRACT(EPOCH FROM (dateutc - TIMESTAMP '#{requested_dateutc}')::interval))")).first

        if closest_snapshot && (closest_snapshot.dateutc - requested_dateutc).abs <= 40.seconds
          render json: closest_snapshot
        else
          render json: { error: 'Snapshot not found within 40 seconds of the specified datetime' }, status: :not_found
        end
      end
    end
  end
end
