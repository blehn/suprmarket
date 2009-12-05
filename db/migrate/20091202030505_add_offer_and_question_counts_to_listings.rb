class AddOfferAndQuestionCountsToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :offers_count, :integer, :default => 0
    add_column :listings, :questions_count, :integer, :default => 0
  end

  def self.down
    remove_column :listings, :questions_count
    remove_column :listings, :offers_count
  end
end
