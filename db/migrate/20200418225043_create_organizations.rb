class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :description
      t.string :creation_date

      t.timestamps
    end
  end
end
