require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Reservation" do
  describe "Initializer" do
    it "is an instance of Reservation" do
      input = {id: 2}
      reservation = Hotel::Reservation.new(input)
      reservation.must_be_kind_of Hotel::Reservation
    end
  end #end of initialize test
end # end of describe Reservation
