require 'api_spec_helper'

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

      get "/api/v1/reviews/1", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)


      market_reviews = body.map {|review| review["content"]}
      market_review_titles = body.map {|review| review["title"] }
      expect(market_reviews).to match_array(["This market is the greatest!", "Great buys!","I love the lemonade stand here!" ])
      expect(market_review_titles).to match_array(["My favorite market in town!", "Good value", "Life gave 'em lemons"])
    end
  end

  describe "POST /api/v1/reviews/:market_id" do
    before(:each) do
      @review_params = FactoryGirl.build(:review).as_json
    end

    it "responds with 201 on success" do
      post "/api/v1/reviews", {:review => @review_params}, {"Accept" => "application/json"}

      expect(response.status).to eq 201
    end

    it "creates a new review given valid data" do
      expect{ post "/api/v1/reviews", {:review => @review_params}, {"Accept" => "application/json"} }.to change{Review.count}.by(1)

      body = JSON.parse(response.body)
      body["name"].should eq("Joe Smith")
      body["title"].should eq("My favorite market in town!")
      body["email"].should eq("joe@example.com")
      body["content"].should eq("This market is the greatest!")
    end
  end
end
