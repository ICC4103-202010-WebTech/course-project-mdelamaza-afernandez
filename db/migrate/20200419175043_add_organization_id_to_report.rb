class AddOrganizationIdToReport < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :organization, null: true, foreign_key: true
  end
end
