require 'spec_helper'

describe "Reviews API" do
  describe "GET /api/v1/reviews/:market_id" do
    it "returns the reviews for that market" do
      review = FactoryGirl.create :review
      review2 = FactoryGirl.create(:review,
                                   :content => "Great buys!",
                                   :title => "Good value")
      review3 = FactoryGirl.create(:review,
                                   :content => "I love the lemonade stand here!",
                                   :title => "Life gave 'em lemons")

      get "/api/v1/reviews/#{review.market_id}", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      market_reviews = body.map {|review| review.content}
      market_review_titles = body.map {|review| review.title }
      expect(market_reviews).to match_array(["This market is the greatest!", "Great buys!","I love the lemonade stand here!" ])
      expect(market_review_titles).to match_array(["My favorite market in town", "Good value", "Life gave 'em lemons"])
    end
  end
end
