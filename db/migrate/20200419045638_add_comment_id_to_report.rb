class AddCommentIdToReport < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :comment, null: true, foreign_key: true
  end
end
