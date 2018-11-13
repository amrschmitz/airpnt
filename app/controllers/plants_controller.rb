class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    @plants = Plant.all
  end

  def show
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
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
    redirect_to plants_path, notice: 'The plant was successfully destroyed.'
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :photo)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
