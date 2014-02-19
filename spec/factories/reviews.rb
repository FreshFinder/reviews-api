# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    market_id 1
    name "Joe Smith"
    email "joe@example.com"
    title "My favorite market in town!"
    content "This market is the greatest!"
  end
end
