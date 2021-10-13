module Api
  module V1
    class BookingsController < ApplicationController
      before_action :auth
      before_action :set_booking, only: [:show, :update, :destroy]
    
      # GET /bookings
      def index
        if current_user
        @bookings = current_user.booking.all
        render json: @bookings
      end
    
      # GET /bookings/1
      def show
        render json: @booking, status: :ok
      end
    
      # POST /bookings
      def create
        @booking = Booking.new(booking_params)
    
        if @booking.save
          render json: @booking, status: :ok
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /bookings/1
      def update
        if @booking.update(booking_params)
          render json: @booking, status: :ok
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /bookings/1
      def destroy
        if @booking.destroy
          render json: { message: 'booking deleted successfully'}, status: :ok
        else
          render json: { error: 'Something went wrong please try again!' }, status: :unprocessable_entity
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_booking
          @booking = Booking.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def booking_params
          params.require(:booking).permit(:cancelled, :booking_time, :spa_n_salon_id, :user_id, :service_id)
        end
    end
    
  end
end