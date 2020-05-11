class AddUserIdToVote < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :user, null: true, foreign_key: true
  end
end