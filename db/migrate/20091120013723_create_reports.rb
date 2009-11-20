class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :listing_id
      t.integer :user_id
      t.string :reason

      t.timestamps
    end
    add_index :reports, :listing_id
    add_index :reports, :user_id
  end

  def self.down
    drop_table :reports
  end
end
