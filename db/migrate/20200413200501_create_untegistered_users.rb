class CreateUntegisteredUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :untegistered_users do |t|
      t.string :name
      t.string :lastName

      t.timestamps
    end
  end
end
