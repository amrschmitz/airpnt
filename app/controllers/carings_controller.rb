class CaringsController < ApplicationController
  before_action :set_caring, only: [:show, :edit, :accept, :decline, :update, :destroy]

  def history
    @sent = current_user.carings
    @received = current_user.requested_carings
    authorize(@sent)
    authorize(@received)
  end

  def show
    authorize(@caring)
  end

  def create
    @user = current_user
    @plant = Plant.find(params[:plant_id])
    @caring = Caring.new(
      user_id: @user.id,
      plant_id: params[:plant_id],
      status: "Pending",
      date_beginning: params[:caring][:date_beginning],
      date_end: params[:caring][:date_end]
    )
    authorize @caring
    @caring.save
    redirect_to history_path, notice: 'Request Submitted!.'
  end

  def edit
  end

  def decline
    @caring.status = "Declined"
    @caring.save
    authorize(@caring)
    redirect_to history_path
  end

  def accept
    @caring.status = "Accepted"
    @caring.save
    authorize(@caring)
    redirect_to history_path
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
    params.require(:caring).permit(:status, :date_beginning, :date_end)
  end

  def set_caring
    @caring = Caring.find(params[:id])
  end
end
