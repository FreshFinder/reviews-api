## FreshFinder Reviews API

This API allows for the reading and creating of farmer's markets reviews.

## Endpoints:

GET `/api/v1/reviews/:market_id` finds reviews for that particular market_id
POST `/api/v1/reviews` with the valid parameters of `:market_id, :name, :email, :title, :content` creates a review for that particular market
