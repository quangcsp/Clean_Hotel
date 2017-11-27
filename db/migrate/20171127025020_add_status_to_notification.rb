class AddStatusToNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :status, :boolean, default: 'false'
  end
end
