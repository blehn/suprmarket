class AddRatingsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :ratings_count, :integer, :default => 0
    add_column :users, :rating, :integer, :default => 100
  end

  def self.down
    remove_column :users, :rating
    remove_column :users, :ratings_count
  end
end
