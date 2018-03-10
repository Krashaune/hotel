require_relative 'reservation'
require 'pry'

# class hotel should store and manage the room and reservation lists

class Hotel
  attr_reader :rooms, :reservations
  # the ability to create a hotel instance
  def initialize
    @rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]# 1-20
    @reservations = []
  end


  # find an available room for the new reservation
  # assign the room number to the new reservation
  def find_available_room
    if reservations.length == 0
      room_number = @rooms.sample
    else
      # go through @rooms array and sample a room_number
      # with that room_number call reserevation_overlap?
      # determine whether the new reservations date range overlaps
      # with reservations in the reservation array
      # until false return room number is then available.
      @rooms.each do |room|
        room_number = rooms.sample
        reservations.each do |reservation|
          if reservation_overlap?(reservation) == true
          end
        end
      end
      return room_number
    end

  end


  # take in a date and list the reservations during that date
  def list_reservations(date)
    # pass in a date
    # go through the reservations array and list all reservations during that date range
    list = []
    reservations.each do |reservation|
      if date.between?(reservation.start_date,reservation.end_date)
      list << reservation
      end
    return list
    end
  end

  def create_reservation(reservation)
    start_date = reservation.start_date
    end_date = reservation.end_date
    room_number = find_available_room
    new_res = Reservation.new(start_date, end_date,room_number)
    reservations << new_res
    return new_res
  end

  # overlap? reservation needs to take in a date range and determine if it overlaps with self any other reservations ie boolean output
  def reservation_overlap?(reservation)
    start_date = reservation.start_date
    end_date = reservation.end_date
    return false if start_date >= end_date || end_date <= start_date
  end
end
