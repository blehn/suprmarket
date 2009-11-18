class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :price
      t.integer :category_id
      t.string :condition
      t.string :zip_code
      t.string :shipping_options

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
