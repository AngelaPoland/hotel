require 'date'

module Hotel

  class Reservation

    attr_reader :id, :room_num, :cost
    attr_accessor :start_date, :end_date

    def initialize(input)

      @id = input[:id]#reservation number
      @room_num = rand(1..20) #room number 1-20
      @cost = cost_of_stay# method to get integer: (date range - 1 day) * 200
      @start_date = input[:start_date]#instance of date
      @end_date = input[:end_date]#instance of date


      # if @end_date != nil
      #   if @end_date <= @start_date
      #     raise ArgumentError.new("Invalid date range.")
      #   end
      # end

    end # end of initialize

    #method to get number of nights to be paid for
    def num_of_nights
      (start_date - end_date) - 1
    end

    #method to get cost of stay
    def cost_of_stay
      num_of_nights * 200
    end


  end #end of class
end #end of module
