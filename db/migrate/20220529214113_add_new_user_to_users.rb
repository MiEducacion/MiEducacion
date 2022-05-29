class AddNewUserToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :new_user, :boolean, :default => true
  end
end
