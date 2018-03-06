require_relative 'spec_helper'
gem 'minitest', '>= 5.0.0'
require 'minitest/pride'

describe 'initialize' do
  it "can create an instance of hotel" do
    new_building = Hotel.new

    new_building.must_be_instance_of Hotel
  end
end
