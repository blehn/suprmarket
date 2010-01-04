class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name
      t.string :county
      t.string :state
      t.string :zip_code
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lon, :precision => 15, :scale => 10

      t.timestamps
    end
    
    add_index :cities, :zip_code
  end

  def self.down
    drop_table :cities
  end
end
