class AddUsernameToUsers < ActiveRecord::Migration
  def change
    # unique username for users
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
