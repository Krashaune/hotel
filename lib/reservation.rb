require_relative 'hotel'
require 'date'
require 'pry'

class Reservation
attr_reader :start_date, :end_date, :room_number

  RATE = 200

  # the ability to create a reservation
  # raise an error for the incorrect date range
  def initialize(start_date, end_date, room_number)
    @room_number = room_number
    @start_date = start_date
    @end_date = end_date

    valid_date
  end # initialize

  #validate the dates for checkin and checkout
  def valid_date
    unless @end_date == nil || @start_date == nil
      if @end_date < @start_date
        raise ArgumentError.new('Invalid date range')
      end
    end
  end


  # calculate days booked to help determine the cost of the reservation
  # days_booked should not include the last day of the reservation
  # checkout day days_booked is the (end_date - start_date)
  def days_booked
    end_date - start_date
  end

  # calculate total cost of reservation using the days booked and RATE
  def total_cost
    total_cost = (days_booked - 1)* RATE
    return total_cost
  end

end #class
