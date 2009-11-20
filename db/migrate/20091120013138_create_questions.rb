class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :listing_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
    add_index :questions, :listing_id
    add_index :questions, :user_id
  end

  def self.down
    drop_table :questions
  end
end
