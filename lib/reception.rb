require 'date'
require 'pry'

module Hotel

  class Reception

    attr_accessor :reservations, :rooms

    def initialize #(input)
      @reservations = []#array of all reservations
      @rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]#array of all rooms

    end # end of initialize

    def add_reservation(start_date, end_date)

      reservation_info = {
        id: reservations.length + 1,
        start_date: start_date,
        end_date: end_date
      }

      new_reservation = Hotel::Reservation.new(reservation_info)

      reservations << new_reservation

      return new_reservation
    end

    # method to stop rooms array from being more than 20 elements long

    # method to find first available room

    # method to get number of nights staying
    # method to calculate cost




  end #end of class
end #end of module
