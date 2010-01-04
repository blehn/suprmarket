class AddListingCountsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :listings_count, :integer, :default => 0
    add_column :users, :buying_count, :integer, :default => 0
    add_column :users, :feedbacks_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :feedbacks_count
    remove_column :users, :buying_count
    remove_column :users, :listings_count
  end
end
