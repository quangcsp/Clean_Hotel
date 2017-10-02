class CreateHotelRates < ActiveRecord::Migration[5.0]
  def change
    create_table :hotel_rates do |t|
      t.integer :rate
      t.references :hotel, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
