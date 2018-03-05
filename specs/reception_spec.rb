require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Reception" do
  describe "Initializer" do
    it "is an instance of Reception" do
      reception = Hotel::Reception.new
      reception.must_be_kind_of Hotel::Reception
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
end
