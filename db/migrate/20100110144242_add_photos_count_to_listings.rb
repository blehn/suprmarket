class AddPhotosCountToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :photos_count, :integer, :default => 0
  end

  def self.down
    remove_column :listings, :photos_count
  end
end
