class AddCounterAmountToOffer < ActiveRecord::Migration
  def self.up
    add_column :offers, :counter_amount, :decimal, :precision => 15, :scale => 2
  end

  def self.down
    remove_column :offers, :counter_amount
  end
end
