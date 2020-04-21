class AddMsgToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :msg, :string
  end
end
