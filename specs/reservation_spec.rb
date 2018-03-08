require_relative 'spec_helper'
gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'pry'

describe 'reservations class' do

  describe 'initialize' do
    it "can create an instance of reservation" do

      new_reservation = Reservation.new(Date.new(2018,2,5), Date.new(2018,2,6),3)
      new_reservation.must_be_instance_of Reservation
    end
  end

  describe 'days_booked' do
    it "calculates days booked correctly" do
      new_reservation = Reservation.new(Date.new(2018,3,10), Date.new(2018,3,15),3)

      new_reservation.days_booked.must_equal 5
    end
  end

  describe 'total_cost' do
    it "calculates total_cost correctly" do
      new_reservation = Reservation.new(Date.new(2018,5,10), Date.new(2018,5,20),9)

      new_reservation.total_cost.must_equal 1800
    end
  end
end
