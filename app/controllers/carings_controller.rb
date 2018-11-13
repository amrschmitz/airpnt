class CaringsController < ApplicationController
  before_action :set_caring, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @carings = Caring.all
  end

  def show
  end

  def new
    @caring = Caring.new
  end

  def create
    @caring = Caring.new(caring_params)
    if @caring.save
      redirect_to caring_path(@caring), notice: 'The caring was successfully updated.'
    else
      render :new
    end
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
    params.require(:caring).permit(:name, :description)
  end

  def set_caring
    @caring = Caring.find(params[:id])
  end
end
