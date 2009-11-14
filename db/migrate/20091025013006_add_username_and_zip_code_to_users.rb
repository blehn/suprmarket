class AddUsernameAndZipCodeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :zip_code, :string
  end

  def self.down
    remove_column :users, :zip_code
    remove_column :users, :username
  end
end
