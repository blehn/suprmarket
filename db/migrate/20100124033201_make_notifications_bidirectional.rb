class MakeNotificationsBidirectional < ActiveRecord::Migration
  def self.up
    rename_column :notifications, :user_id, :seller_id
    add_column :notifications, :buyer_id, :integer
    add_index :notifications, :seller_id
    add_index :notifications, :buyer_id
  end

  def self.down
    remove_column :notifications, :buyer_id
    rename_column :notifications, :seller_id, :user_id
  end
end
