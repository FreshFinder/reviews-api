class Api::V1::ReviewsController < ApplicationController

  def show
    @reviews = Review.where(market_id: params[:id])
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: review, :status => 201
    else
      render json: review_errors(review), :status => 422
    end
  end

  def index
    reviews = Review.all
    render json: reviews, :status => 201
  end

  private

  def review_params
    params.require(:review).permit(:market_id, :name, :email, :title, :content)
  end

  def review_errors(review)
    messages = review.errors.messages
    errors_hash = {"errors" => messages}
  end
end
