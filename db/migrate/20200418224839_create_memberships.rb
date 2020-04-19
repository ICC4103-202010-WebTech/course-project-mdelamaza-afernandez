class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.boolean :owner

      t.timestamps
    end
  end
end
