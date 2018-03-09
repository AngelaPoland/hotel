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
      block.cost.must_equal 450.00
    end
  end

end
