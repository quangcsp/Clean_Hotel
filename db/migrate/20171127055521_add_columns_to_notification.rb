class AddColumnsToNotification < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :review, foreign_key: true
  end
end
