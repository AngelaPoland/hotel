module Hotel

  NUM_OF_ROOMS = 20

  class Room

    attr_accessor :room_num, :booked_dates, :blocked_dates

    def initialize(room_num)
      @room_num = room_num
      @booked_dates = [] # should contain elements of Ranges
      @blocked_dates_booked = []

    end

  end
end
