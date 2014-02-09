class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :market_id
      t.string :name
      t.string :email
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
