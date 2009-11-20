require 'spec_helper'

describe Report do
  before(:each) do
    @valid_attributes = {
      :listing_id => 1,
      :user_id => 1,
      :reason => "value for reason"
    }
  end

  it "should create a new instance given valid attributes" do
    Report.create!(@valid_attributes)
  end
end
