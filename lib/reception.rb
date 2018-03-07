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

    def add_reservation(start_date, end_date, num) #num isn't going to actually give the room number being assigned anymore, but if I remove it a bunch of previous tests will be mad
      raise ArgumentError.new("Room number passed is invalid.") if num > NUM_OF_ROOMS || num < 0

      reservation_info = {
        id: reservations.length + 1,
        start_date: start_date,
        end_date: end_date,
        room_num: assign_available_room(start_date,end_date)
      }
      new_reservation = Hotel::Reservation.new(reservation_info)

      @rooms.each do |room|
        if room.room_num == num
         room.booked_dates << new_reservation.range #.to_a would change range into an array of dates - might consider
        end
      end
      reservations << new_reservation


      return new_reservation
    end


    #returns all instances of reservations for a given date
    def reservations_by_date(date)
      valid_reservations = []
      reservations.each do |reservation|
        if reservation.range.include? (date)
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

    # should check date ranges available and return first available room or argument that no dates are available
    def check_availability(start_date, end_date)
      available_rooms = []

      @rooms.each do |room|
        if room.booked_dates.empty?
          available_rooms << room
        end
        room.booked_dates.each do |range|
          if range.cover?(start_date..end_date) # WHY?!
            next if available_rooms.include? room # just a check so that the same room isn't put into available_rooms more than once
            available_rooms << room
          end
        end
      end

      if available_rooms.empty?
        raise ArgumentError.new("No available rooms for those dates.")
      end

      return available_rooms
    end #end of check_availability method

    # method to find first available room number
    def assign_available_room(sd,ed)
      available_rooms = check_availability(sd,ed)

      return available_rooms[0].room_num
    end


  end #end of class
end #end of module
