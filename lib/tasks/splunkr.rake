namespace :splunkr do
  namespace :load do
    
    desc 'load cities'
    task :cities => :environment do
      require 'csv'
      #data = File.read("#{RAILS_ROOT}/tmp/import/ZIP_CODES.txt")

      last_lat = 0
      last_lon = 0
      CSV.foreach("#{RAILS_ROOT}/tmp/import/ZIP_CODES.txt") do |row|

        lat = !row[1].nil? ? row[1].gsub(/\+/,'') : last_lat
        lon = !row[2].nil? ? row[2].gsub(/\+/,'') : last_lon
        county = !row[5].nil? ? row[5].capitalize : ""
        name = !row[3].nil? ? row[3].capitalize : ""
        City.create(:zip_code => row[0], :lat => lat, :lon => lon, :name => name, :state => row[4], :county => county)
        last_lat = lat
        last_lon = lon
      end
    end
    
    desc 'load categories'
    task :categories => :environment do
      %w[appliances
      antiques
      barter
      bikes
      boats
      books
      business
      computer
      free
      furniture
      general
      jewelry
      materials
      rvs
      sporting
      tickets
      tools
      wanted
      arts+crafts
      auto\ parts
      baby+kids
      beauty+hlth
      cars+trucks
      cds/dvd/vhs
      cell\ phones
      clothes+acc
      collectibles
      electronics
      farm+garden
      garage\ sale
      household
      motorcycles
      music\ instr
      photo+video
      toys+games
      video\ gaming].each do |category|
        Category.create(:title => category)
      end

    end
  end
end
