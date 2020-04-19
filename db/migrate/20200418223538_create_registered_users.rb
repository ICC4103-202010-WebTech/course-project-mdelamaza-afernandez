class CreateRegisteredUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :registered_users do |t|
      t.string :email
      t.string :user_name
      t.string :password
      t.string :location
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
