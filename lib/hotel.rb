require_relative 'reservation'
require_relative 'rooms'
require 'pry'

# class hotel should store and manage the room and reservation lists

class Hotel
  attr_reader :rooms, :reservations
  # the ability to create a hotel instance
  def initialize
    @rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]# 1-20
    @reservations = []
  end


  # As an administrator, I can reserve a room for a given date range
  # As an administrator, I can reserve an available room for a given date range
  def create_reservation(start_date, end_date,room)
    # create instance of reservation
    # store the reservation
    unless room_available?(start_date, end_date, room)
      raise ArgumentError.new("Room number #{room} is not available")
    end

    new_reservation = Reservation.new(start_date, end_date, room)
    @reservations << new_reservation
  end



  # As an administrator, I can access the list of reservations for a specific date
  def list_reservations_for_specific_date(date)
    # find reservations that contain the date
    @reservations.select { |reservation| reservation.contains?(date) }
  end

  # As an administrator, I can view a list of rooms that are not reserved for a given date range
  def list_rooms_available(start_date,end_date)
    rooms.select {|room| room_available?(start_date, end_date, room) }
  end

  def room_available?(start_date, end_date,room)
    # find all reservations for room
    # check reservations for date
    select_rooms = reservations.select { |reservation| reservation.room_number == room }

    select_rooms.each do |res|
      if res.contains?(start_date) || res.contains?(end_date) || (res.start_date >= start_date && res.end_date <= end_date)
        return false
      end
    end
    return true
  end #room_available
end #class
