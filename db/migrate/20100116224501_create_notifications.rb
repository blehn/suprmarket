class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :listing_id
      t.integer :offer_id
      t.string :for
      t.string :type
      t.text :data
      t.string :state
      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
