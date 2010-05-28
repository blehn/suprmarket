class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.string :code
      t.datetime :expires_at
      t.integer :sender_id
      t.integer :user_id
      t.boolean :used, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :invites
  end
end
