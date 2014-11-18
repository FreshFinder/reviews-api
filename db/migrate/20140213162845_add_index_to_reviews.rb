class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, :market_id
  end
end
