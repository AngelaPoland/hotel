require 'date'
require 'pry'

module Hotel
  class Block

    attr_reader :cost, :blocked_rooms, :reserved_rooms, :full_cost, :cost_per_room

    def initialize(start_date, end_date, num) #num is number of rooms being requested
      raise ArgumentError.new("If you only need one room, please create a regular reservation instead") if num <= 1

      raise ArgumentError.new("You can only have a maximum of 5 rooms in a block.") if num >= 6

      #@date_range = (start_date...end_date)
      @blocked_rooms = [] #array of room_nums per date range requested
      @num = num
      @cost = num * 150.00 #of full block
      @start_date = start_date
      @end_date = end_date
      @reserved_rooms = []
      @cost_per_room = ((end_date - start_date).to_i) * 150.00
      @full_cost = cost_per_room * num #of full block
    end

    def range
      (@start_date...@end_date) #exclusive date range
    end

    #this will reserve one room at a time from the block
    def reserve
      if reserved_rooms.length < @num
        reserved_rooms << blocked_rooms[0]
      else
        raise ArgumentError.new("No more rooms available for this block.")
      end
    end



  end
end
