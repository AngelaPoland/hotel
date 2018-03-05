require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Reservation" do
  describe "Initializer" do
    it "is an instance of Reservation" do
      reservation = Hotel::Reservation.new
      reservation.must_be_kind_of Hotel::Reservation
    end
  end
end
