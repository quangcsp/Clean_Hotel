class CreateReviewRates < ActiveRecord::Migration[5.0]
  def change
    create_table :review_rates do |t|
      t.integer :rate
      t.integer :user_review
      t.integer :user_rate

      t.timestamps
    end
  end
end
