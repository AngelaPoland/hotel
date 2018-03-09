require 'date'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require 'simplecov'
SimpleCov.start


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/reservation'
require_relative '../lib/reception'
require_relative '../lib/block'
require_relative '../lib/room'
