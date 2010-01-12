class AddStateToOffers < ActiveRecord::Migration
  def self.up
    add_column :offers, :state, :string, :default => 'new'
  end

  def self.down
    remove_column :offers, :state
  end
end
