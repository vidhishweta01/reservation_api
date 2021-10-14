module Api
  module V1
    class SpaNSalonsController < ApplicationController
      before_action :auth
      before_action :set_spa_n_salon, only: %i[show update destroy]

      # GET /spa_n_salons
      def index
        @spa_n_salons = SpaNSalon.all
        render json: @spa_n_salons
      end

      # GET /spa_n_salons/1
      def show
        @services = @spa_n_salon.services.order('cost asc')

        render json: @services
      end

      # POST /spa_n_salons
      def create
        if owner_is_correct?
          @spa_n_salon = SpaNSalon.new(spa_n_salon_params)
          if @spa_n_salon.save
            render json: @spa_n_salon, status: :ok
          else
            render json: @spa_n_salon.errors, status: :unprocessable_entity
          end
        else
          render json: { message: "unauthorized owner "}, status: :ok
        end
      end

      # PATCH/PUT /spa_n_salons/1
      def update
        if owner_is_correct?
          if @spa_n_salon.update(spa_n_salon_params)
            render json: @spa_n_salon
          else
            render json: @spa_n_salon.errors, status: :unprocessable_entity
          end
        else
          render json: { message: "unauthorized owner "}, status: :ok
        end
        
      end

      # DELETE /spa_n_salons/1
      def destroy
        if owner_is_correct?
          if @spa_n_salon.destroy
            render json: { message: 'deleted successfully' }, status: :ok
          else
            render json: @spa_n_salon.errors, status: :unprocessable_entity
          end 
        else
          render json: { message: "unauthorized owner "}, status: :ok
        end
      end

      def sorted_service
        @salon = SpaNSalon.joins('INNER JOIN Services on spa_n_salons.id = services.spa_n_salon_id').select('*').order('cost asc')

        render json: @salon
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_spa_n_salon
        @spa_n_salon = SpaNSalon.find(params[:id])
      end

      def owner_is_correct?
        if current_user
          return true if Owner.where(user_id: current_user.id)
        end
        false
      end

      # Only allow a list of trusted parameters through.
      def spa_n_salon_params
        params.require(:spa_n_salon).permit(:companyName, :address, :available_chairs, :owner_id)
      end
    end
  end
end
