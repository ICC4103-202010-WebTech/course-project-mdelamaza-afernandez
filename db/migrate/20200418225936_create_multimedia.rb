class CreateMultimedia < ActiveRecord::Migration[6.0]
  def change
    create_table :multimedia do |t|

      t.timestamps
    end
  end
end
