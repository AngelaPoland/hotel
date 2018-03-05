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
    it "adds a reservation to the reservations" do
      reception = Hotel::Reception.new
      
    end

  end
end
