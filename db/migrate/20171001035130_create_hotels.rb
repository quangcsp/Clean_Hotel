class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.text :description
      t.integer :star
      t.float :rate_sum
      t.integer :rate_count
      t.string :avatar

      t.timestamps
    end
  end
end
