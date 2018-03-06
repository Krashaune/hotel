require_relative 'hotel'
require 'date'
require 'pry'

class Reservation

  RATE = 200

  # the ability to create a reservation
  # raise an error for the incorrect date range
  def initialize(start_date, end_date)
    @id = rand(001..999)
    @room_number = :room_number
    @start_date = start_date
    @end_date = end_date
    @cost = days_booked * RATE
    @reservations = []

    # raise ArgumentError.new('Invalid date') if start_date.valid_date? == false || end_date.valid_date == false

    # @reservations << Reservation.new
  end # initialize

  # load a list of all rooms with reservations and the reservation details
  # reservations come from the hotel
  # return reservations
  # def load_reservations
  #   reserved_rooms = Hotel.reservations
  #   return reserved_rooms
  # end

  # get an available room from hotel for the new reservation
  # def add_room
  #   find_room = Hotel.find_available_room
  #   return find_room
  # end

  # calculate days booked to help determine the cost of the reservation
  # days_booked should not include the last day of the reservation
  # checkout day days_booked is the (end_date - start_date)
  def days_booked
    @end_date - @start_date
  end

  # calculate total cost of reservation using the days booked and RATE
  def total_cost
    total_cost = days_booked * RATE
    return total_cost
  end



end
