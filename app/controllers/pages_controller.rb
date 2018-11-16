class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def landing
    if params[:query].present?
      @plants = Plant.search_by_name_and_description(params[:query])
    else
      @plants = Plant.all
    end
    authorize(@plants)
  end
end
