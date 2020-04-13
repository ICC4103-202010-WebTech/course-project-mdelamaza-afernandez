class CreateMailBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :mail_boxes do |t|
      t.string :inbox

      t.timestamps
    end
  end
end
