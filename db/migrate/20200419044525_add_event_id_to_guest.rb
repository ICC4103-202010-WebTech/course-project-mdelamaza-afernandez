class AddEventIdToGuest < ActiveRecord::Migration[6.0]
  def change
    add_reference :guests, :event, null: true, foreign_key: true
  end
end
