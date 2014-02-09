require 'spec_helper'

describe Review do
  describe "with valid params" do
    it "creates a review" do
      FactoryGirl.build(:review).should be_valid
    end
  end

  describe "with invalid params" do
    it "is missing a market id" do
      FactoryGirl.build(:review, :market_id => nil).should_not be_valid
    end
  end
end
