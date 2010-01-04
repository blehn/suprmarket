require 'config/environment'
require 'excelsior'
data = File.read("#{RAILS_ROOT}/tmp/import/ZIP_CODES.txt")

last_lat = 0
last_lon = 0
Excelsior::Reader.rows(data) do |row|
  
  lat = !row[1].nil? ? row[1].gsub(/\+/,'') : last_lat
  lon = !row[2].nil? ? row[2].gsub(/\+/,'') : last_lon
  county = !row[5].nil? ? row[5].capitalize : ""
  name = !row[3].nil? ? row[3].capitalize : ""
  City.create(:zip_code => row[0], :lat => lat, :lon => lon, :name => name, :state => row[4], :county => county)
  last_lat = lat
  last_lon = lon
end