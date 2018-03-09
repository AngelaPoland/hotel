require 'simplecov'
SimpleCov.start
require_relative 'spec_helper'

describe "Block" do
  describe "initialize" do
    it "is an instance of Block" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 10)
      block = Hotel::Block.new(start_date, end_date, 3)
      block.must_be_kind_of Hotel::Block
    end

    it "will not accept more than 5 or less than 2 rooms" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 10)
      proc{Hotel::Block.new(start_date, end_date, 1)}.must_raise ArgumentError
      proc{Hotel::Block.new(start_date, end_date, 6)}.must_raise ArgumentError
    end

    it "contains a blocked_rooms array" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 10)
      block = Hotel::Block.new(start_date, end_date, 3)
      block.blocked_rooms.must_be_instance_of Array
    end

    it "gives the correct cost" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 10)
      block = Hotel::Block.new(start_date, end_date, 3)
      block.full_cost.must_equal 1350.00
      block.cost_per_room.must_equal 450.0
    end
  end

  describe "reserve method" do
    it "will put an available room into reserved_rooms array" do
      start_date = Date.new(2018, 3, 7)
      end_date = Date.new(2018, 3, 10)
      block = Hotel::Block.new(start_date, end_date, 3)
      block.reserve
      block.reserved_rooms.length.must_equal 1
      block.reserve
      block.reserved_rooms.length.must_equal 2
    end

    it "will raise an error if no more rooms available in block" do
      start_date = Date.new(2018, 4, 10)
      end_date = Date.new(2018, 4, 15)
      block = Hotel::Block.new(start_date, end_date, 3)

      block.reserve
      block.reserve
      block.reserve

      proc{block.reserve}.must_raise ArgumentError
    end

  end

end
