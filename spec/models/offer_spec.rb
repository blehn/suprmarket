require 'spec_helper'

describe Offer do
  before(:each) do
    @valid_attributes = {
      :listing_id => 1,
      :user_id => 1,
      :amount => 9.99,
      :pickup_availability => "value for pickup_availability",
      :message => "value for message"
    }
  end

  it "should create a new instance given valid attributes" do
    Offer.create!(@valid_attributes)
  end
end
