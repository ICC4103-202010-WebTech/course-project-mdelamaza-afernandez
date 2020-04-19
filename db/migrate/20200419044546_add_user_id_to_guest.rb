class AddUserIdToGuest < ActiveRecord::Migration[6.0]
  def change
    add_reference :guests, :user, null: true, foreign_key: true
  end
end
