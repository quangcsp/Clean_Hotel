class CreateHotelImages < ActiveRecord::Migration[5.0]
  def change
    create_table :hotel_images do |t|
      t.string :image
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
