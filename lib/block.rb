require 'date'
require 'pry'

module Hotel
  class Block #< Reception

    def initialize(start_date, end_date, num) #num is number of rooms being requested
      raise ArgumentError.new("If you only need one room, please create a regular reservation instead") if num <= 1

      raise ArgumentError.new("You can only have a maximum of 5 rooms in a block.") if num >= 6

      @date_range = (start_date...end_date)
      @blocked_rooms = [] #array of available rooms per date range requested
      @num = num
      @cost = num * 150.00
    end


  end
end
