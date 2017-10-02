class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :avatar
      t.integer :star
      t.float :rate_avg
      t.integer :phone
      t.text :desciption

      t.timestamps
    end
  end
end
