require 'date'
require 'pry'

require_relative 'reservation'
require_relative 'room'


module Hotel

  class Reception

    attr_reader :reservations, :rooms, :block_reservations

    def initialize #(input)
      @reservations = []#array of all reservations
      @rooms = all_rooms
      @block_reservations = []

    end # end of initialize

    # TODO: update add_reservation to check blocked_reservations
    def add_reservation(start_date, end_date, num)

      raise ArgumentError.new("Room number passed is invalid.") if num > NUM_OF_ROOMS || num < 0

      raise ArgumentError.new("Date entered is not valid") if !(start_date.instance_of? Date) || !(end_date.instance_of? Date)


      booked_room_num = assign_available_room(start_date,end_date, num)

      reservation_info = {
        id: reservations.length + 1,
        start_date: start_date,
        end_date: end_date,
        room_num: booked_room_num
      }
      new_reservation = Hotel::Reservation.new(reservation_info)

      @rooms.each do |room|
        if room.room_num == booked_room_num
          room.booked_dates << new_reservation.range
        end
      end

      reservations << new_reservation

      return new_reservation
    end # end of add_reservation




    # takes check_in date, check_out date, num of rooms being requested
    def create_block(sd, ed, num)
      # compare with any other block reservations date Ranges
      # compare with single reservations date ranges/Rooms
      # select which rooms will be used in block
      # add range to all room's booked_dates

      new_block = Hotel::Block.new(sd, ed, num)

      num.times do
      assigned_room = check_availability(sd, ed).last
      reservation = add_reservation(sd, ed, assigned_room.room_num)
      new_block.blocked_rooms << reservation.room_num
        @rooms.each do |room|
          if reservation.room_num == room.room_num
          room.booked_dates << new_block.range
          end
        end
      end

      return new_block
    end #end of create_block




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

    #returns an array of available rooms based on dates
    def check_availability(start_date, end_date)
      available_rooms = []

      @rooms.each do |room|
        if room.booked_dates.empty? #&& room.blocked_dates.empty?
          available_rooms << room
        elsif room.booked_dates.length > 0
          room.booked_dates.each do |range|
            if !(range.include? (end_date - 1)) || !(range.include? start_date)
            available_rooms << room
            end
          end
        end
      end

      if available_rooms.empty?
        raise ArgumentError.new("No available rooms for those dates.")
      end

      return available_rooms
    end #end of check_availability method

    # method to check if requested room is available otherwise return FIRST available room number
    def assign_available_room(sd,ed, num)
      available_rooms = check_availability(sd,ed)

      available_rooms.each do |room|
        if room.room_num == num
          return room.room_num
        end
      end

      return available_rooms[0].room_num

    end


  end #end of class
end #end of module
