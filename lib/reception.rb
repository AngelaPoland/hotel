require 'date'

module Hotel

  class Reception

    attr_reader :reservations, :rooms


    def initialize #(input)
      @reservations = []#array of all reservations
      @rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]#array of all rooms
      # @cost = 200# (date range - 1 day) * 200
      # @start_date = Date.new(now)#instance of date
      # @end_date = Date.new(2018, 3, 10)#instance of date

    end # end of initialize

    def add_reservation
    end

    # method to stop rooms array from being more than 20 elements long

    # method to find first available room

    # method to get number of nights staying
    # method to calculate cost




  end #end of class
end #end of module
