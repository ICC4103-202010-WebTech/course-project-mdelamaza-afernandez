class AddEventIdToDateOption < ActiveRecord::Migration[6.0]
  def change
    add_reference :date_options, :event, null: true, foreign_key: true
  end
end
