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

  describe 'create_reservation' do
    it "can create a reservation" do
      new_building = Hotel.new

      new_res = new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),3)

      new_building.reservations.length.must_equal 1
      new_building.reservations.length.must_be :>, 0
    end

    it "can create multiple reservations" do
      new_building = Hotel.new

      new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),2)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),7)
      new_building.create_reservation(Date.new(2018,3,8),Date.new(2018,3,11),20)


      new_building.reservations.length.must_equal 3
      new_building.reservations.length.must_be :>, 2
    end

    it "raises an ArgumentError when a room is not avaialable" do
      new_building = Hotel.new

      proc { new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),1)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),1)
      }.must_raise ArgumentError
    end

    it "raises an ArgumentError when all the rooms are books" do
      new_building = Hotel.new

      new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),1)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),2)
      new_building.create_reservation(Date.new(2018,3,8),Date.new(2018,3,11),3)
      new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),4)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),5)
      new_building.create_reservation(Date.new(2018,3,8),Date.new(2018,3,11),6)
      new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),7)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),8)
      new_building.create_reservation(Date.new(2018,3,8),Date.new(2018,3,11),9)
      new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),10)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),11)
      new_building.create_reservation(Date.new(2018,3,8),Date.new(2018,3,11),12)
      new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),13)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),14)
      new_building.create_reservation(Date.new(2018,3,8),Date.new(2018,3,11),15)
      new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),16)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),17)
      new_building.create_reservation(Date.new(2018,3,8),Date.new(2018,3,11),18)
      new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),19)
      new_building.create_reservation(Date.new(2018,3,7),Date.new(2018,3,10),20)

      proc { new_building.create_reservation(Date.new(2018,3,8),Date.new(2018,3,11),3)
      }.must_raise ArgumentError
    end

  end

  describe 'list_reservations_for_specific_date' do
    it "will list all reservations during the date passed in" do
      new_building = Hotel.new


      new_building.create_reservation(Date.new(2018,4,2),Date.new(2018,4,7),1)
      new_building.create_reservation(Date.new(2018,9,1),Date.new(2018,9,6),1)


      res = new_building.list_reservations_for_specific_date(Date.new(2018,4,4))
      res.must_be_kind_of Array

      res.length.must_equal 1

      res_2 = new_building.list_reservations_for_specific_date(Date.new(2017,4,4))
      res_2.length.must_equal 0


    end
    #two reservations that overlap and make sure it displays 2
  end


  describe 'list_rooms_available' do
      it "can list all available rooms" do
        new_building = Hotel.new

        res_1 = new_building.create_reservation(Date.new(2018,4,2),Date.new(2018,4,7),2)
        res_2 = new_building.create_reservation(Date.new(2018,4,1),Date.new(2018,4,6),1)
        res_3 = new_building.create_reservation(Date.new(2018,4,3),Date.new(2018,4,5),3)
        # new_building.create_reservation(Date.new(2018,5,7),Date.new(2018,5,14),1)

        list = new_building.list_rooms_available(Date.new(2018,4,3),Date.new(2018,4,6))

        list.must_be_kind_of Array
        list.wont_include 2
        list.wont_include 1
        list.wont_include 3
      end
  end

  describe 'room_available?' do
    it "returns true when room is available" do
      new_building = Hotel.new

      res_0 = new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),1)
      res_1 = new_building.create_reservation(Date.new(2018,4,2),Date.new(2018,4,7),2)

      res_2 = new_building.room_available?(Date.new(2018,3,6),Date.new(2018,3,9),2)

      res_2.must_equal true
    end

    it "returns false when a room is not available" do
      new_building = Hotel.new

      res_0 = new_building.create_reservation(Date.new(2018,3,6),Date.new(2018,3,9),1)
      res_1 = new_building.create_reservation(Date.new(2018,4,2),Date.new(2018,4,7),2)

      res_2 = new_building.room_available?(Date.new(2018,3,6),Date.new(2018,3,9),1)

      res_2.must_equal false
    end
  end
end
