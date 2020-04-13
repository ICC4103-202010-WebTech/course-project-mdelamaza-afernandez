class CreateRegisterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :register_users do |t|
      t.string :userName
      t.string :fullName
      t.string :location
      t.string :image
      t.string :description
      t.string :email

      t.timestamps
    end
  end
end
