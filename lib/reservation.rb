require 'date'
require 'pry'

module Hotel

  class Reservation

    attr_reader :cost, :id, :start_date, :end_date, :room_num
    #attr_accessor :id, :start_date, :end_date, :room_num

    def initialize(input)
      @id = input[:id] # reservation number
      @room_num = input[:room_num] # room number 1-20
      @start_date = input[:start_date] # instance of date
      @end_date = input[:end_date] # instance of date
      @cost = cost_of_stay

      if end_date < start_date
        raise ArgumentError.new("Check Out date cannot be before or same as Check In date.")
      end
    end # end of initialize

    #method to get number of nights to be paid for
    def num_of_nights
      num_of_nights = (end_date - start_date).to_i
    end

    #returns an instance of Range method (will be used in Reception)
    def range
      (start_date...end_date) #exclusive date range
    end

    #method to get cost of stay
    def cost_of_stay
      num_of_nights * 200.00
    end

  end #end of class
end #end of module
