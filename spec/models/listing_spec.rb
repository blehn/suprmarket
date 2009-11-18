require 'spec_helper'

describe Listing do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :price => "value for price",
      :category_id => 1,
      :condition => "value for condition",
      :zip_code => "value for zip_code",
      :shipping_options => "value for shipping_options"
    }
  end

  it "should create a new instance given valid attributes" do
    Listing.create!(@valid_attributes)
  end
end
