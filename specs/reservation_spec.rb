require_relative 'spec_helper'

describe 'initialize' do
  it "can create an instance of reservation" do

    new_reservation = Reservation.new

    new_reservation.must_be_instance_of Reservation
  end
end
