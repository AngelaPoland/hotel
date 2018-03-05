require 'date'

module Hotel

  class Reservation

    attr_reader :id, :room_num, :cost
    attr_accessor :start_date, :end_date

    def initialize(#input)
      @id = #reservation number
      @room_num = #room number 1-20
      @cost = # (date range - 1 day) * 200
      @start_date = #instance of date
      @end_date = #instance of date


      if @end_date != nil
        if @end_date <= @start_date
          raise ArgumentError.new("Invalid date range.")
        end
      end

    end # end of initialize


  end #end of class
end #end of module
