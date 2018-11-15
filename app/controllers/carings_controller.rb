class CaringsController < ApplicationController
  before_action :set_caring, only: [:show, :edit, :update, :destroy]

  def history
    @carings = Caring.where("user" == current_user)
    authorize(@carings)
  end

  def show
  end

  def new
    @user = current_user
    @plant = Plant.find(params[:plant_id])
    @caring = Caring.new(user_id: @user.id, plant_id: params[:plant_id], status: "Pending")
    @caring.save
    authorize @caring
    redirect_to plant_path(@plant), notice: 'Request Submitted!.'
  end

  def create
    @caring = Caring.new()
  end

  def edit
  end

  def update
    if @caring.update(caring_params)
      redirect_to caring_path(@caring), notice: 'The caring was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @caring.destroy
    redirect_to carings_path, notice: 'The caring was successfully destroyed.'
  end

  private

  def caring_params
    params.require(:caring).permit(:status)
  end

  def set_caring
    @caring = Caring.find(params[:id])
  end
end
