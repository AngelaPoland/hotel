require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Reception" do
  describe "Initializer" do
    it "is an instance of Reception" do
      reception = Hotel::Reception.new
      reception.must_be_kind_of Hotel::Reception
    end

    it "must contain an array of Rooms" do
      reception = Hotel::Reception.new
      reception.rooms.must_be_instance_of Array
      reception.rooms[0].must_be_instance_of Hotel::Room
      reception.rooms[19].must_be_instance_of Hotel::Room
    end

  end

  describe "add_reservation" do

    it "creates an instance of Reservation" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 9)
      reception = Hotel::Reception.new
      reception.add_reservation(start_date, end_date).must_be_instance_of Hotel:: Reservation
    end

    it "adds a reservation to the reservations" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 14)
      reception = Hotel::Reception.new
      reception.add_reservation(start_date, end_date)
      reception.reservations.length.must_equal 1
    end
  end


  describe "reservations by date" do

    it "returns an array of reservations" do
      reception = Hotel::Reception.new

      reception.add_reservation(Date.new(2018, 3, 10), Date.new(2018, 3, 13))

      reception.add_reservation(Date.new(2018, 3, 14), Date.new(2018, 3, 18))

      reception.add_reservation(Date.new(2018, 3, 20), Date.new(2018, 3, 22))

      reception.add_reservation(Date.new(2018, 3, 25), Date.new(2018, 3, 27))

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


end
