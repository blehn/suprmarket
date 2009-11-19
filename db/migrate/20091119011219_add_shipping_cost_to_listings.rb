class AddShippingCostToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :shipping_cost, :decimal, :precision => 15, :scale => 2
  end

  def self.down
    remove_column :listings, :shipping_cost
  end
end
