class AddUserIdToMembership < ActiveRecord::Migration[6.0]
  def change
    add_reference :memberships, :user, null: true, foreign_key: true
  end
end
