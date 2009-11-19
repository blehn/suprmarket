class AddWillingToShipToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :willing_to_ship, :boolean
  end

  def self.down
    remove_column :listings, :willing_to_ship
  end
end
