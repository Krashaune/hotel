
class Reservation

# RATE 200
# the ability to create a reservation
# raise an error for the incorrect date range
  def initialize
    @id = :id
    @start_date = :start_date
    @end_date = :end_date
    @cost = :cost
    @days_booked = 0
  end # initialize


# access a list of all reservations


# get an available room from hotel for the new reservation


# calculate days booked to help determine the cost of the reservation
# days_booked should not include the last day of the reservation
# checkout day


# calculate total cost of reservation using the days booked and RATE




end
