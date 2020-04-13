class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :images
      t.string :videos
      t.string :description
      t.string :location
      t.datetime :creationDate
      t.datetime :finalDateToVote
      t.string :votes

      t.timestamps
    end
  end
end
