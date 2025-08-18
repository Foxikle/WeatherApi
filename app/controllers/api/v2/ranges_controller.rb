# frozen_string_literal: true
module Api
  module V2
    class RangesController < ApplicationController
      # GET /api/v2/range
      def show
        start_date = DateTime.parse(params[:start_date].to_s)
        end_date   = DateTime.parse(params[:end_date].to_s)
        segments   = params[:segments].to_i

        unless segments.positive?
          render json: { error: 'Segments parameter must be a positive number' }, status: :bad_request
          return
        end

        numeric_columns = %i[
    tempf humidity windspeedmph windgustmph maxdailygust winddir uv solarradiation
    hourlyrainin dailyrainin weeklyrainin monthlyrainin totalrainin battout tempinf
    humidityin baromrelin baromabsin batt_co2
  ]

        seconds_per_segment = (end_date.to_time - start_date.to_time).to_f / segments

        avg_sql = numeric_columns.map { |c| "AVG(#{c}) AS #{c}" }.join(", ")

        results = WeatherSnapshot
                    .select("#{avg_sql}, FLOOR(EXTRACT(EPOCH FROM dateutc - TIMESTAMP '#{start_date}') / #{seconds_per_segment}) AS segment_index")
                    .where(dateutc: start_date..end_date)
                    .group("segment_index")
                    .order("segment_index")

        output = results.map do |r|
          seg_idx = r.segment_index.to_i
          seg_start = start_date + Rational(seg_idx * seconds_per_segment, 86400)
          seg_end   = [start_date + Rational((seg_idx + 1) * seconds_per_segment, 86400), end_date].min

          averages = numeric_columns.index_with { |col| r[col] }

          # midpoint datetime of the snapshots in this segment
          snapshots = WeatherSnapshot
                        .where(dateutc: seg_start..seg_end)
                        .pluck(:dateutc)
          segment_datetime = if snapshots.any?
                               snapshots.first + (snapshots.last - snapshots.first) / 2
                             else
                               seg_start + (seg_end - seg_start) / 2
                             end

          { start: seg_start, end: seg_end, datetime: segment_datetime, averages: averages }
        end

        render json: output
      end
    end
  end
end
