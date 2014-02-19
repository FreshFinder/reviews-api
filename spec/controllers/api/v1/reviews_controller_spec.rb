require 'spec_helper'

describe Api::V1::ReviewsController do
  let!(:review1) { FactoryGirl.create(:review, market_id: market.id) }
  let!(:review2) { FactoryGirl.create(:review, market_id: market.id) }
  let!(:review3) { FactoryGirl.create(:review, market_id: market.id) }

  describe "GET /api/v1/reviews" do
    it "returns a list of reviews" do
      get :index, format: :json
      body = JSON.parse(response.body)
      expect(body.length).to eq Review.all.count
      expect(body[0]['review']).to eq review1.body
    end
  end

  describe 'POST /api/v1/reviews' do
    it 'returns an error message if submitting new review with invalid market' do
      post :create, format: :json, review: {
        "market_id" => "10",
        "title" => "Good tie-dye tee-shirts",
        "review" => "So good"
        # "rating" => "Thumbs Up"
      }
      hash = JSON.parse(response.body)
      expect(hash).to eq ['not a valid review']
    end

    it 'returns review when valid review created' do
      post :create, format: :json, review: {
        "market_id" => "10",
        "title" => "Great marshmellows",
        "review" => "So good"
        # "rating" => "Thumbs Up"
      }
      hash = JSON.parse(response.body)
      expect(hash.length).to eq 4
    end
  end

  describe 'GET /api/v1/reviews/:id' do
    it 'returns the attributes for a review' do
      get :show, id: review2.id, format: :json
      hash = JSON.parse(response.body)
      expect(hash["market_id"]).to eq review2.id
      expect(hash["title"]).to eq review2.title
      expect(hash["review"]).to eq review2.body
    end
  end
end
