class AddDateOptionIdToVote < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :date_option, null: true, foreign_key: true
  end
end
