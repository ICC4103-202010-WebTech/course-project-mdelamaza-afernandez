class AddEventIdToReport < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :event, null: true, foreign_key: true
  end
end
