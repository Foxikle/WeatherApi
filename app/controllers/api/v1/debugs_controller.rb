module Api
  module V1
    class DebugsController < ApplicationController
      # GET /api/v1/debug
      def show
        puts "Received data:"
        puts params.inspect
        render json: { message: 'Data received successfully' }, status: :ok
      end
    end
  end
end
