class AddUserIdToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :user_id, :integer, :default => 1
  end
end
