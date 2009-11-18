class AddIndexesToCategoryIdAndUserIdOnListings < ActiveRecord::Migration
  def self.up
    add_index :listings, :category_id
    add_index :listings, :user_id
  end

  def self.down
    remove_index :listings, :category_id
    remove_index :listings, :category_id
  end
end
