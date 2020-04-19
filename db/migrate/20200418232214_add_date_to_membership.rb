class AddDateToMembership < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :date, :string
  end
end
