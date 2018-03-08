require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Reservation" do
  describe "Initializer" do
    it "is an instance of Reservation" do
      input = {id: 3, start_date: Date.new(2018, 3, 5), end_date: Date.new(2018, 3, 10), room_num: 3 }
      reservation = Hotel::Reservation.new(input)
      reservation.must_be_kind_of Hotel::Reservation
    end

    it "has a start date as instance of time" do
      input = {id: 4, start_date: Date.new(2018, 3, 5), end_date: Date.new(2018, 3, 10), room_num: 3}
      reservation = Hotel::Reservation.new(input)
      reservation.start_date.must_be_instance_of Date
    end

    it "gives an integer 1-20 for room num" do
      input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 10), room_num: 2}
      reservation = Hotel::Reservation.new(input)

      reservation.room_num.must_be_instance_of Integer
      reservation.room_num.must_be :>=, 1
      reservation.room_num.must_be :<=, 20
    end

    it "raises an error for invalid dates" do
      input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 4), room_num: 1}

      proc{Hotel::Reservation.new(input)}.must_raise ArgumentError
    end
  end #end of initialize test

  describe "num_of_nights method" do
    it "gives number of nights" do
    input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 10), room_num: 3}
    reservation = Hotel::Reservation.new(input)
    reservation.num_of_nights.must_be_instance_of Integer
    reservation.num_of_nights.must_equal 4
    end
  end

  describe "cost_of_stay method" do
    it "returns a Float" do
    input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 10), room_num: 3}
    reservation = Hotel::Reservation.new(input)
    reservation.cost_of_stay.must_be_instance_of Float
    end

    it "returns the total cost of stay" do

    input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 10), room_num: 3}
    reservation = Hotel::Reservation.new(input)
    reservation.cost_of_stay.must_be_instance_of Float
    reservation.cost_of_stay.must_equal 800.00


    input2 = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 7), room_num: 4}
    reservation2 = Hotel::Reservation.new(input2)
    reservation2.cost_of_stay.must_equal 200.00

    input3 = {id: 10, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 9), room_num: 10}
    reservation3 = Hotel::Reservation.new(input3)
    reservation3.cost_of_stay.must_equal 600.00

    input4 = {id: 11, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 8), room_num: 11}
    reservation4 = Hotel::Reservation.new(input4)
    reservation4.cost_of_stay.must_equal 400.00

    end
  end

  describe "range" do
    it "returns a range" do
    input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 10), room_num: 3}
    reservation = Hotel::Reservation.new(input)
    reservation.range.must_be_instance_of Range
    #binding.pry
    end
  end


end # end of describe Reservation
