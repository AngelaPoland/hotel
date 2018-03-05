require 'date'

module Hotel

  class Reception

    attr_reader :id, :room_num, :cost
    attr_accessor :start_date, :end_date

    def initialize(input)
      @reservations = #array of all reservations
      @rooms = #array of all rooms
      @cost = # (date range - 1 day) * 200
      @start_date = #instance of date
      @end_date = #instance of date

    end # end of initialize

    def add_reservation
    end



  end #end of class
end #end of module
