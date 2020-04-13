class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :images
      t.string :videos
      t.string :description
      t.datetime :creationDate

      t.timestamps
    end
  end
end
