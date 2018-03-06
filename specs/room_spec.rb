require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Room" do

  describe "Initializer" do
    it "is an instance of Room" do
      room = Hotel::Room.new(2)
      room.must_be_kind_of Hotel::Room
    end

    it "has an array of booked_dates" do
      room = Hotel::Room.new(3)
      room.booked_dates.must_be_instance_of Array
    end

  end
end
