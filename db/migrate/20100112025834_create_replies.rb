class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.string :source_type
      t.integer :source_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
    
    add_index :replies, [:source_type, :source_id]
  end

  def self.down
    drop_table :replies
  end
end
