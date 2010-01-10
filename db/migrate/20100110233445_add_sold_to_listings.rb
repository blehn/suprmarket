class AddSoldToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :sold, :boolean, :default => false
  end

  def self.down
    remove_column :listings, :sold
  end
end
