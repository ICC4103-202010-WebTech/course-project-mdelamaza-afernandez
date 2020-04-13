class AddUnresgisteredUserIdToRegistration < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :Unresgistered_User, :reference
  end
end
