require_relative 'spec_helper'
gem 'minitest', '>= 5.0.0'
require 'minitest/pride'

describe 'initialize' do
  it "can create an instance of hotel" do
    new_building = Hotel.new
    new_building.must_be_instance_of Hotel
  end

  it "has a list of 20 rooms" do
    new_building = Hotel.new
    new_building.rooms.length.must_equal 20
  end

  it "has a empty list of reservations" do
    new_building = Hotel.new
    new_building.reservations.length.must_equal 0
  end

end
