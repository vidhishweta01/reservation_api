# frozen_string_literal: true

module Api
  module V1
    class WorkSchedulesController < ApplicationController
      before_action :auth
      before_action :owner_is_correct, only: %i[create update destroy]
      before_action :set_work_schedule, only: %i[show update destroy]

      # GET /work_schedules
      def index
        @work_schedules = WorkSchedule.all

        render json: @work_schedules
      end

      # GET /work_schedules/1
      def show
        render json: @work_schedule
      end

      # POST /work_schedules
      def create
        @work_schedule = WorkSchedule.new(work_schedule_params)
        if @work_schedule.save
          render json: @work_schedule, status: :ok
        else
          render json: @work_schedule.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /work_schedules/1
      def update
        if @work_schedule.update(work_schedule_params)
          render json: @work_schedule
        else
          render json: @work_schedule.errors, status: :unprocessable_entity
        end
      end

      # DELETE /work_schedules/1
      def destroy
        if @work_schedule.destroy
          render json: { message: 'work schedule deleted successfully' }, status: :ok
        else
          render json: @work_schedule.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_work_schedule
        @work_schedule = WorkSchedule.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def work_schedule_params
        params.require(:work_schedule).permit(:day, :start_time, :end_time, :spa_n_salon_id)
      end
    end
  end
end
