class CreateSystemAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :system_accesses do |t|
      t.string :googleAcoount

      t.timestamps
    end
  end
end
