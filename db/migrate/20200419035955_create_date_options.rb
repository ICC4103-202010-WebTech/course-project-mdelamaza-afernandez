class CreateDateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :date_options do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
