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
  # go through the rooms array to pick a room number
  # if the room number is not included in the reservations array
  # assign the room number to the new reservation
  def find_available_room
    if reservations.length == 0
      room_number = @rooms.sample
    else
  # look to overlap? to determine whether a reservation overlaps with another and if not i,e false room number is then available.
  
      room_number = @rooms.sample
      # @rooms.collect { |room_number|  }
    return room_number
    end
  end

  def create_reservation(start_date, end_date)
    new_res = Reservation.new(start_date, end_date,find_available_room)
    reservations << new_res
  end
end
