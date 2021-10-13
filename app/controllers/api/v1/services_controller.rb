# frozen_string_literal: true

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
        render json: @service
      end

      # POST /services
      def create
        p "creating"
        @service = Service.new(service_params)

        if @service.save
          render json: @service, status: :ok
        else
          render json: @service.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /services/1
      def update
        if @service.update(service_params)
          render json: @service
        else
          render json: @service.errors, status: :unprocessable_entity
        end
      end

      # DELETE /services/1
      def destroy
        @service.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_service
        @service = Service.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def service_params
        params.require(:service).permit(:name, :cost, :duration, :spa_n_salon_id)
      end
    end
  end
end
