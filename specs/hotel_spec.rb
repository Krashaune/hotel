require_relative 'spec_helper'
gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'awesome_print'
require 'pry'

describe 'hotel class' do

  describe '#initialize' do
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

  describe 'find_available_room' do
    it "can find a random room within the correct room numbers" do
      new_building = Hotel.new
      room_number = new_building.find_available_room

      room_number.must_be :>,0
      room_number.must_be :<,20
    end

    # it "can find an available room when there is one or more reservation" do
    #   new_building = Hotel.new
    #   # room_number = new_building.find_available_room
    #
    #   new_reservation = new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9))
    #   new_reservation_2 = new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,8))
    #
    #   # ap new_building.reservations
    #   # binding.pry
    #   # new_building.reservations.room_number.must_be :>,0
    #   # new_building.reservations.room_number.must_be :<,20
    #   new_building.new_reservation.room_number.wont_be_same_as new_building.new_reservation_2.room_number
    # end
  end

  describe 'create_reservation' do
    it "can create a reservation" do
      new_building = Hotel.new
      new_res = Reservation.new(Date.new(2018,3,6),Date.new(2018,3,9),3)
      new_building.create_reservation(new_res)

      new_building.reservations.length.must_equal 1
      new_building.reservations.length.must_be :>, 0
    end

    it "can create multiple reservations" do
      new_building = Hotel.new

      new_res_1 = Reservation.new(Date.new(2018,3,6),Date.new(2018,3,9),2)
      new_res_2 = Reservation.new(Date.new(2018,3,7),Date.new(2018,3,10),7)
      new_res_3 = Reservation.new(Date.new(2018,3,8),Date.new(2018,3,11),20)

      new_building.create_reservation(new_res_1)
      new_building.create_reservation(new_res_2)
      new_building.create_reservation(new_res_3)

      new_building.reservations.length.must_equal 3
      new_building.reservations.length.must_be :>, 2
      # ap new_building.reservations
    end
  end

  describe 'list_reservations' do
    it "will list all reservations during the date passed in" do
      new_building = Hotel.new

      new_reservation1 = Reservation.new(Date.new(2018,6,1),Date.new(2018,6,6),1)
      new_reservation = Reservation.new(Date.new(2018,9,1),Date.new(2018,9,6),1)

      new_building.create_reservation(new_reservation1)
      new_building.create_reservation(new_reservation)


      res = new_building.list_reservations(Date.new(2018,6,2))
      res.must_be_kind_of Array

      res.length.must_equal 1

    end
  end
end
