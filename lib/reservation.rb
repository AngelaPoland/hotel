require 'date'

module Hotel

  class Reservation

    attr_reader :id, :room_num, :cost
    attr_accessor :start_date, :end_date

    def initialize(input)

      @id = input[:id]#reservation number
      @room_num = rand(1..20) #room number 1-20
      @cost = 400# integer: (date range - 1 day) * 200
      @start_date = Date.new(2018, 3, 5)#instance of date
      @end_date = Date.new(2018, 3, 10)#instance of date


      # if @end_date != nil
      #   if @end_date <= @start_date
      #     raise ArgumentError.new("Invalid date range.")
      #   end
      # end

    end # end of initialize

    #method to get number of nights to be paid for

    #method to get cost of stay


  end #end of class
end #end of module
