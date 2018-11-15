class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @plants = policy_scope(Plant)
  end

  def show
    # @plant = Plant.where.not(latitude: nil, longitude: nil)

    @markers = [
      {
        lng: @plant.longitude,
        lat: @plant.latitude
      }
    ]
  end

  def new
    @plant = Plant.new
    authorize(@plant)
  end

  def create
    @plant = current_user.plants.build(plant_params)
    authorize(@plant)
    if @plant.save!
      redirect_to plant_path(@plant), notice: 'The plant was successfully updated.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      redirect_to plant_path(@plant), notice: 'The plant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @plant.destroy
    redirect_to root_path, notice: 'The plant was successfully destroyed.'
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :photo, :address)
  end

  def set_plant
    @plant = Plant.find(params[:id])
    authorize(@plant)
  end
end
