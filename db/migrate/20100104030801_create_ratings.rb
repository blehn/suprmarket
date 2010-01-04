class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :rater_id
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
    
    add_index :ratings, :user_id
  end

  def self.down
    drop_table :ratings
  end
end
