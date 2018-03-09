require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Reception" do
  describe "Initializer" do
    before do
      @reception = Hotel::Reception.new
    end

    it "is an instance of Reception" do

      @reception.must_be_kind_of Hotel::Reception
    end

    it "must contain an array of Rooms" do

      @reception.rooms.must_be_instance_of Array
      @reception.rooms[0].must_be_instance_of Hotel::Room
      @reception.rooms[19].must_be_instance_of Hotel::Room
    end

  end

  describe "add_reservation" do

    it "creates an instance of Reservation" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 9)
      room_num = 5
      reception = Hotel::Reception.new
      reception.add_reservation(start_date, end_date, room_num).must_be_instance_of Hotel:: Reservation
    end

    it "adds a reservation to the reservations" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 14)
      room_num = 5
      reception = Hotel::Reception.new
      reception.add_reservation(start_date, end_date, room_num)
      reception.reservations.length.must_equal 1
    end

    it "shovels a range of dates into the room's booked_dates array" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 10)
      room_num = 6
      reception = Hotel::Reception.new


      reception.add_reservation(start_date, end_date, room_num)
      reception.rooms[5].booked_dates.wont_be_empty
      reception.rooms[5].booked_dates[0].must_be_instance_of Range
    end

    it "raises an error if room num is invalid" do
      reception = Hotel::Reception.new

      proc{reception.add_reservation(Date.new(2018, 3, 14), Date.new(2018, 3, 18), 30)}.must_raise ArgumentError
    end

    it "raises an error if start/end dates are not valid Date objects" do
      reception = Hotel::Reception.new

      proc{reception.add_reservation("2018-04-03", Date.new(2018, 3, 18), 11)}.must_raise ArgumentError

      proc{reception.add_reservation(5,3,12)}.must_raise ArgumentError

      proc{reception.add_reservation(Date.new(2018, 3, 14), [2018, 04, 01], 19)}.must_raise ArgumentError

    end
  end


  describe "reservations by date" do

    it "returns an array of reservations" do
      reception = Hotel::Reception.new

      reception.add_reservation(Date.new(2018, 3, 10), Date.new(2018, 3, 13), 8)

      reception.add_reservation(Date.new(2018, 3, 14), Date.new(2018, 3, 18), 6)

      reception.add_reservation(Date.new(2018, 3, 20), Date.new(2018, 3, 22), 2)

      reception.add_reservation(Date.new(2018, 3, 25), Date.new(2018, 3, 27), 3)

      reception.reservations_by_date(Date.new(2018, 3, 25)).must_be_instance_of Array

      reception.reservations_by_date(Date.new(2018, 3, 25))[0].must_be_instance_of Hotel::Reservation
    end
  end

  describe "all_rooms method" do
    it "returns an array of rooms" do
      reception = Hotel::Reception.new
      reception.all_rooms.must_be_instance_of Array
      reception.all_rooms[0].must_be_instance_of Hotel::Room
      reception.all_rooms[19].must_be_instance_of Hotel::Room
    end

    it "only contains 20 rooms" do
      reception = Hotel::Reception.new
      reception.all_rooms.length.wont_be :>, 20
      reception.all_rooms.length.wont_be :<, 0

    end
  end

  describe "check_availability" do
    before do
      @start_date = Date.new(2018, 3, 25)
      @end_date = Date.new(2018, 4, 1)
      @reception = Hotel::Reception.new
    end

    it "should return an array of available rooms per date range" do

      @reception.add_reservation(@start_date, @end_date, 1)
      @reception.add_reservation(@start_date,Date.new(2018, 3, 27) , 2)
      @reception.add_reservation(@start_date,Date.new(2018, 4, 3) , 3)
      @reception.add_reservation(Date.new(2018, 3, 20),Date.new(2018, 4, 3) , 4)
      @reception.add_reservation(Date.new(2018, 4, 1),Date.new(2018, 4, 3) , 5)

      @reception.check_availability(@start_date, @end_date).must_be_instance_of Array

      @reception.check_availability(@start_date, @end_date)[0].must_be_instance_of Hotel::Room

      @reception.check_availability(@start_date, @end_date).length.must_equal 17

      #binding.pry
    end
    it "should raise argument if no rooms available" do


      count = 1
      20.times do
        @reception.add_reservation(@start_date, @end_date, count)
        count +=1
      end
      #binding.pry
      proc{@reception.check_availability(@start_date, Date.new(2018, 3, 30))}.must_raise ArgumentError
    end

    it "should not allow more than one instance of the same room in available_rooms" do


      @reception.add_reservation(@start_date, @end_date, 1)
      @reception.add_reservation(@start_date, @end_date, 2)
      @reception.add_reservation(@start_date, @end_date, 6)
      @reception.add_reservation(Date.new(2018, 4, 10), Date.new(2018, 4, 15), 1)


      @reception.check_availability(@start_date, @end_date).length.must_equal @reception.check_availability(@start_date, @end_date).uniq.length
    end
  end

  describe "assign_available_room" do
    it "returns an integer 1-20" do
      start_date = Date.new(2018, 3, 25)
      end_date = Date.new(2018, 4, 1)
      num = 10
      reception = Hotel::Reception.new

      reception.assign_available_room(start_date, end_date, num).must_be_instance_of Integer

      reception.assign_available_room(start_date, end_date, 4).wont_be :>, 20
      reception.assign_available_room(start_date, end_date, 9).wont_be :<, 1
    end

    it "assigns requested room first, otherwise returns first available room" do
      reception = Hotel::Reception.new
      start_date = Date.new(2018, 5, 1)
      end_date = Date.new(2018, 5, 3)


      reception.assign_available_room(start_date, end_date, 10).must_equal 10
      reception.assign_available_room(start_date, end_date, 9).must_equal 9

      reception.add_reservation(start_date, end_date, 10)
      #binding.pry
      reception.assign_available_room(start_date, end_date, 10).must_equal 1
    end

  end

  describe "create_block method" do
    it "returns an instance of Block" do
      reception = Hotel::Reception.new

      reception.create_block(Date.new(2018, 10, 20), Date.new(2018, 10, 22), 4).must_be_instance_of Hotel::Block
    end

    it "only assigns the requested amount of rooms" do
      reception = Hotel::Reception.new

      new_block = reception.create_block(Date.new(2018, 10, 20), Date.new(2018, 10, 22), 4)
     #binding.pry
      new_block.blocked_rooms.length.must_equal 4

    end



  end

end
