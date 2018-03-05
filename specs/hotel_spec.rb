require_relative 'spec_helper'

describe 'initialize' do
  it "can create an instance of hotel" do
    new_building = Hotel.new

    new_building.must_be_instance_of Hotel
  end
end
