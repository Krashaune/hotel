require_relative 'reservation'
require 'pry'

# class hotel should store and manage the room and reservation lists

class Hotel
  attr_accessor :rooms, :reservations
  # the ability to create a hotel instance
  def initialize
    @rooms = %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]# 1-20
    @reservations = []
  end


  # access a list of all rooms (available and unavailable)


  # returns a list of all reservations
  # def reservations
  #   hotel.reservations
  # end

  # find an available room for the new reservation
  # go through the rooms array to pick a room number
  # if the room number is not included in the reservations array
  # assign the room number to the new reservation
  def find_available_room
    if reservations.length == 0
      rooms.sample
    else
      rooms.fetch { |room| reservations.room_number.include? == false}
    end
    return rooms
  end
end

# new_hot = Hotel.new
# new_hot.find_available_room
