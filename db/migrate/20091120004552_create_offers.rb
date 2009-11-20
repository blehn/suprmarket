class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :listing_id
      t.integer :user_id
      t.decimal :amount, :precision => 15, :scale => 2
      t.string :pickup_availability
      t.text :message

      t.timestamps
    end
    add_index :offers, :listing_id
    add_index :offers, :user_id
  end

  def self.down
    drop_table :offers
  end
end
