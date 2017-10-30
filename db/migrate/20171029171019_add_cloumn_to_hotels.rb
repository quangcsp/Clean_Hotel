class AddCloumnToHotels < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :max_price, :float, default: 0
    add_column :hotels, :min_price, :float, default: 0
  end
end
