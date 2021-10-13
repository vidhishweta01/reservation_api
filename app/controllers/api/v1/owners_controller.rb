module  Api
  module V1
    class OwnersController < ApplicationController
      before_action :auth
      before_action :set_owner, only: [:show, :update, :destroy]
    
      # GET /owners
      def index
        @owners = Owner.all

        render json: @owners
      end
    
      # GET /owners/1
      def show
        render json: @owner, status: :ok
      end
    
      # POST /owners
      def create
        puts "I m here"
        @owner = Owner.new(owner_params)
    
        if @owner.save
          render json: @owner, status: :ok
        else
          render json: @owner.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /owners/1
      def update
        if @owner.update(owner_params)
          render json: @owner, status: :ok
        else
          render json: @owner.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /owners/1
      def destroy
        if @owner.destroy
          render json: { message: 'owner account delelted successfully' }, status: :ok
        else
          render json: { error: 'Something went wrong please try again!' }, status: :unprocessable_entity
        end
      end
    
      private
      # Use callbacks to share common setup or constraints between actions.
      def set_owner
        @owner = Owner.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def owner_params
        params.require(:owner).permit(:GSTIN, :PAN, :user_id)
      end   
    end   
  end
end