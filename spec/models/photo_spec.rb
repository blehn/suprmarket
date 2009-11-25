require 'spec_helper'

describe Photo do
  before(:each) do
    @valid_attributes = {
      :listing_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Photo.create!(@valid_attributes)
  end
end
