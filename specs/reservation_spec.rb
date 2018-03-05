require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Reservation" do
  describe "Initializer" do
    it "is an instance of Reservation" do
      input = {id: 3, start_date: Date.new(2018, 3, 5), end_date: Date.new(2018, 3, 10) }
      reservation = Hotel::Reservation.new(input)
      reservation.must_be_kind_of Hotel::Reservation
    end

    it "has a start date as instance of time" do
      input = {id: 4, start_date: Date.new(2018, 3, 5), end_date: Date.new(2018, 3, 10)}
      reservation = Hotel::Reservation.new(input)
      reservation.start_date.must_be_instance_of Date
    end

    it "gives an integer 1-20 for room num" do
      input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 10)}
      reservation = Hotel::Reservation.new(input)

      reservation.room_num.must_be_instance_of Integer
      reservation.room_num.must_be :>=, 1
      reservation.room_num.must_be :<=, 20
    end

    it "raises an error for invalid dates" do
      input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 4)}
    
      proc{Hotel::Reservation.new(input)}.must_raise ArgumentError
    end
  end #end of initialize test

  describe "num_of_nights method" do
    it "gives number of nights" do
    input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 10)}
    reservation = Hotel::Reservation.new(input)
    reservation.num_of_nights.must_be_instance_of Integer
    reservation.num_of_nights.must_equal 3
    end
  end

  describe "cost_of_stay method" do
    it "returns a Float" do
    input = {id: 5, start_date: Date.new(2018, 3, 6), end_date: Date.new(2018, 3, 10)}
    reservation = Hotel::Reservation.new(input)
    reservation.cost_of_stay.must_be_instance_of Float
    reservation.cost_of_stay.must_equal 600.00
    end
  end


end # end of describe Reservation
