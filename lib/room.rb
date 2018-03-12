module Hotel

  NUM_OF_ROOMS = 20

  class Room

    attr_accessor :booked_dates
    attr_reader :room_num

    def initialize(room_num)
      @room_num = room_num
      @booked_dates = [] # should contain elements of Date Ranges
    end

  end
end
