# frozen_string_literal: true

module Api
  module V1
    class SpaNSalonsController < ApplicationController
      before_action :auth
      before_action :owner_iscorrect, only: %i[create update destroy]
      before_action :set_spa_n_salon, only: %i[show update destroy]

      # GET /spa_n_salons
      def index
        @spa_n_salons = SpaNSalon.all
        @service = []
        @spa_n_salons.each do |salon|
          @service << salon.services.order('cost asc')
        end
        render json: @spa_n_salons
      end

      # GET /spa_n_salons/1
      def show
        @spa_n_salon
        @services = @spa_n_salon.services.order('cost asc')
        
        render json: @services
      end

      # POST /spa_n_salons
      def create
        @spa_n_salon = SpaNSalon.new(spa_n_salon_params)

        if @spa_n_salon.save
          render json: @spa_n_salon, status: :ok
        else
          render json: @spa_n_salon.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /spa_n_salons/1
      def update
        if @spa_n_salon.update(spa_n_salon_params)
          render json: @spa_n_salon
        else
          render json: @spa_n_salon.errors, status: :unprocessable_entity
        end
      end

      # DELETE /spa_n_salons/1
      def destroy
        if @spa_n_salon.destroy
          render json: { message: "deleted successfully" }, status: :ok
        else
          render json: @spa_n_salon.errors, status: :unprocessable_entity
        end
      end
      
      def sorted_service
        @salon = SpaNSalon.joins(:services)
        @service = []
        @salon.each do |salon|
          @service << salon.services.order('cost asc')
        end
        render json: @se
      end
      
      def working_dayTime
        SpaNSalon.join(:work_schedules)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_spa_n_salon
        @spa_n_salon = SpaNSalon.find(params[:id])
      end

      def owner_iscorrect
        spa_id = params[:id]
        @owner = SpaNSalons.where(id: spa_id).pluck(:owner_id)
        @current_owner = current_user.owner if current_user
        @owner == @current_owner
      end

      # Only allow a list of trusted parameters through.
      def spa_n_salon_params
        params.require(:spa_n_salon).permit(:companyName, :address, :available_chairs, :owner_id)
      end
    end
  end
end
