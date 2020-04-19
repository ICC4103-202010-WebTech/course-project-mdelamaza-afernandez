class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.boolean :owner

      t.timestamps
    end
  end
end
