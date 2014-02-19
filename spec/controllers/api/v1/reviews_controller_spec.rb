require 'api_spec_helper'

describe Api::V1::ReviewsController do
  describe "Reviews API" do
    describe "GET /api/v1/reviews" do
      it "returns the reviews for that market" do
        review = FactoryGirl.create :review
        review2 = FactoryGirl.create(:review,
                                     :content => "Great buys!",
                                     :title => "Good value")
        review3 = FactoryGirl.create(:review,
                                     :content => "I love the lemonade stand here!",
                                     :title => "Life gave 'em lemons")

        get :index, format: :json
        body = JSON.parse(response.body)
    
        body = JSON.parse(response.body)
        expect(response.status).to eq 201
        expect(body.length).to eq Review.all.count
      end
    end
  end
end
