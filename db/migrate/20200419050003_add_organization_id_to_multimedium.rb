class AddOrganizationIdToMultimedium < ActiveRecord::Migration[6.0]
  def change
    add_reference :multimedia, :organization, null: true, foreign_key: true
  end
end
