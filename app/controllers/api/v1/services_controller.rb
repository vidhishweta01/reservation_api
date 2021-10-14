module Api
  module V1
    class ServicesController < ApplicationController
      before_action :auth
      before_action :set_service, only: %i[show update destroy]

      # GET /services
      def index
        @services = Service.all

        render json: @services
      end

      # GET /services/1
      def show
        available_slot
      end

      # POST /services
      def create
        if owner_is_correct?
          @service = Service.new(service_params)
          if @service.save
            render json: @service, status: :ok
          else
            render json: @service.errors, status: :unprocessable_entity
          end
        else
          render json: { message: 'unauthorized owner ' }, status: :ok
        end
      end

      # PATCH/PUT /services/1
      def update
        if owner_is_correct?
          if @service.update(service_params)
            render json: @service
          else
            render json: @service.errors, status: :unprocessable_entity
          end
        else
          render json: { message: 'unauthorized owner ' }, status: :ok
        end
      end

      # DELETE /services/1
      def destroy
        if owner_is_correct?
          if @service.destroy
            render json: { message: 'deleted successfully' }
          else
            render json: @service.errors, status: :unprocessable_entity
          end
        else
          render json: { message: 'unauthorized owner ' }, status: :ok
        end
      end

      def available_slot
        @slot = []
        duration = @service.duration
        chairs = SpaNSalon.where(id: @service.spa_n_salon_id).pick(:available_chairs)
        service_schedule = WorkSchedule.where(spa_n_salon_id: @service.spa_n_salon_id)
          .pluck(Arel.sql('Time(start_time), Time(end_time), day'))
        service_schedule.each do |day|
          difference = (day[1].to_f - day[0].to_f) / duration
          @slot << { service: @service.name, day: day[2], start_time: day[0], end_time: day[1], slots: difference,
                     duration_per_slot: "#{duration} hours", total_customer_per_slot: chairs }
        end
        render json: @slot
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_service
        @service = Service.find(params[:id])
      end

      def owner_is_correct?
        spa_id = params[:spa_n_salon_id]
        @owner = SpaNSalon.where(id: spa_id).pick(:owner_id)
        if current_user
          @current_owner = Owner.where(user_id: current_user.id)
          return true if @owner == @current_owner
        end
        false
      end

      # Only allow a list of trusted parameters through.
      def service_params
        params.require(:service).permit(:name, :cost, :duration, :spa_n_salon_id)
      end
    end
  end
end
