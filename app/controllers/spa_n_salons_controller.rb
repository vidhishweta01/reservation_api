class SpaNSalonsController < ApplicationController
  before_action :set_spa_n_salon, only: [:show, :update, :destroy]

  # GET /spa_n_salons
  def index
    @spa_n_salons = SpaNSalon.all

    render json: @spa_n_salons
  end

  # GET /spa_n_salons/1
  def show
    render json: @spa_n_salon
  end

  # POST /spa_n_salons
  def create
    @spa_n_salon = SpaNSalon.new(spa_n_salon_params)

    if @spa_n_salon.save
      render json: @spa_n_salon, status: :created, location: @spa_n_salon
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
    @spa_n_salon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spa_n_salon
      @spa_n_salon = SpaNSalon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spa_n_salon_params
      params.require(:spa_n_salon).permit(:companyName, :GSTIN, :PAN, :address, :available_chairs, :user_id)
    end
end