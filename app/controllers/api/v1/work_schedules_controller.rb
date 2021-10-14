module Api
  module V1
    class WorkSchedulesController < ApplicationController
      before_action :auth
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
        if owner_is_correct?
          @work_schedule = WorkSchedule.new(work_schedule_params)
          if @work_schedule.save
            render json: @work_schedule, status: :ok
          else
            render json: @work_schedule.errors, status: :unprocessable_entity
          end
        else
          render json: { message: 'unauthorized owner ' }, status: :ok
        end
      end

      # PATCH/PUT /work_schedules/1
      def update
        if owner_is_correct?
          if @work_schedule.update(work_schedule_params)
            render json: @work_schedule
          else
            render json: @work_schedule.errors, status: :unprocessable_entity
          end
        else
          render json: { message: 'unauthorized owner ' }, status: :ok
        end
      end

      # DELETE /work_schedules/1
      def destroy
        if owner_is_correct?
          if @work_schedule.destroy
            render json: { message: 'work schedule deleted successfully' }, status: :ok
          else
            render json: @work_schedule.errors, status: :unprocessable_entity
          end
        else
          render json: { message: 'unauthorized owner ' }, status: :ok
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_work_schedule
        @work_schedule = WorkSchedule.find(params[:id])
      end

      def owner_is_correct?
        spa_id = params[:spa_n_salon_id]
        @owner = SpaNSalon.where(id: spa_id).pluck(:owner_id)
        if current_user
          @current_owner = Owner.where(user_id: current_user.id)
          return true if @owner == @current_owner
        end
        false
      end

      # Only allow a list of trusted parameters through.
      def work_schedule_params
        params.require(:work_schedule).permit(:day, :start_time, :end_time, :spa_n_salon_id)
      end
    end
  end
end
