class Api::V1::ReviewsController < ApplicationController

  def show
    @reviews = Review.where(market_id: params[:id])
  end

end
