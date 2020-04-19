class AddOrganizationIdToMembership < ActiveRecord::Migration[6.0]
  def change
    add_reference :memberships, :organization, null: true, foreign_key: true
  end
end
