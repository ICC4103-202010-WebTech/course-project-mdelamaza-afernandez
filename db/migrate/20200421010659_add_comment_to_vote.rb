class AddCommentToVote < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :comment, :string
  end
end
