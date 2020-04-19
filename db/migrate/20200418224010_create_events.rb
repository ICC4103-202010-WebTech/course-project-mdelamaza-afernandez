class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :description
      t.string :location
      t.string :creation_date
      t.string :voted_date

      t.timestamps
    end
  end
end
