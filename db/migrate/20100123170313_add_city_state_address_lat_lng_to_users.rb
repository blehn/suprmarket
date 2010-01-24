class AddCityStateAddressLatLngToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :lat, :decimal, :precision => 15, :scale => 6
    add_column :users, :lng, :decimal, :precision => 15, :scale => 6
  end

  def self.down
    remove_column :users, :lng
    remove_column :users, :lat
    remove_column :users, :address_2
    remove_column :users, :address_1
    remove_column :users, :state
    remove_column :users, :city
  end
end
