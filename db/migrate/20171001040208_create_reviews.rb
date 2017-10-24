class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.float :rate, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.references :hotel, foreign_key: true, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
