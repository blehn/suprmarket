# require 'config/environment'
# require 'excelsior'
# data = File.read("#{RAILS_ROOT}/tmp/import/ZIP_CODES.txt")
# 
# last_lat = 0
# last_lon = 0
# Excelsior::Reader.rows(data) do |row|
#   
#   lat = !row[1].nil? ? row[1].gsub(/\+/,'') : last_lat
#   lon = !row[2].nil? ? row[2].gsub(/\+/,'') : last_lon
#   county = !row[5].nil? ? row[5].capitalize : ""
#   name = !row[3].nil? ? row[3].capitalize : ""
#   City.create(:zip_code => row[0], :lat => lat, :lon => lon, :name => name, :state => row[4], :county => county)
#   last_lat = lat
#   last_lon = lon
# end

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'config/environment'
a = Nokogiri::HTML(open('http://shop.ebay.com/?_from=R40&_trksid=p3902.m38.l1313&_nkw=a&_sacat=See-All-Categories'))
lorem_text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
categories = Category.all
cities = City.all
users = User.all
a.css('.v4lnk').map(&:text).each do |title|
  willing_to_ship = [true, false].rand
  shipping_cost = willing_to_ship ? rand(1000) : nil
  Listing.create({
    :title => title, 
    :description => lorem_text, 
    :user_id => users.rand.id,
    :category_id => categories.rand.id,
    :price => rand(1000),
    :zip_code => cities.rand.zip_code,
    :condition => ['new', 'used'].rand,
    :willing_to_ship => willing_to_ship,
    :shipping_cost => shipping_cost
  })
    
end