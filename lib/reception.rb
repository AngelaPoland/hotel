require 'date'
require 'pry'

require_relative 'reservation'
require_relative 'room'


module Hotel

  class Reception

    attr_accessor :reservations, :rooms

    def initialize #(input)
      @reservations = []#array of all reservations
      @rooms = all_rooms

    end # end of initialize

    def add_reservation(start_date, end_date, num)
      raise ArgumentError.new("Room number passed is invalid.") if num > NUM_OF_ROOMS || num < 0

      reservation_info = {
        id: reservations.length + 1,
        start_date: start_date,
        end_date: end_date,
        room_num: num
      }
      new_reservation = Hotel::Reservation.new(reservation_info)

      @rooms.each do |room|
        if room.room_num == num
         room.booked_dates << new_reservation.range
       end
      end
      reservations << new_reservation


      return new_reservation
    end


    #returns all instances of reservations for a given date
    def reservations_by_date(date)
      valid_reservations = []
      reservations.each do |reservation|
        if reservation.range.cover? (date)
          valid_reservations << reservation
        end
      end
      return valid_reservations
    end

    def all_rooms
      all_rooms = []
      NUM_OF_ROOMS.times do |i|
        all_rooms << Hotel::Room.new(i + 1)
      end
      return all_rooms
    end

    #def available_rooms_by_date


    # def available_rooms_by_date(start_date, end_date)
    #   rooms.each do |booked_dates|
    #     if booked_dates.include?
    # end


    # method to find first available room


  end #end of class
end #end of module
