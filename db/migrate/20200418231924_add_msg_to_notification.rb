class AddMsgToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :msg, :string
  end
end
