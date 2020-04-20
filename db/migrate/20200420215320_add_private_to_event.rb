class AddPrivateToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :private, :boolean
  end
end
