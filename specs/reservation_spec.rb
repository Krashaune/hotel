require_relative 'spec_helper'
gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'pry'

describe 'reservations class' do

  describe 'initialize' do
    it "can create an instance of reservation" do

      new_reservation = Reservation.new(Date.new(2018,2,5), Date.new(2018,2,6))
      new_reservation.must_be_instance_of Reservation
    end

  describe 'load_reservations' do

      it "can list all reservations made" do

        new_hotel = Hotel.new

        reservations = [
          reservation_001 = Reservation.new(start_date = Date.new(2018,3,12),end_date = Date.new(2018,3,16)),
          reservation_002 = Reservation.new(start_date = Date.new(2018,3,14), end_date = Date.new(2018,3,20)),
          reservation_003 = Reservation.new(start_date = Date.new(2018,4,12), end_date = Date.new(2018,3,16))
      ]

  
        new_hotel.reservations
        @reservations.must_be_kind_of Array
        @reservations.must_equal reservations


      end
    end
  end
end
