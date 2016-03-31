#!/usr/bin/env ruby
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'quickunion'

class QuickunionTest < Minitest::Test
  attr_reader :quickunion

  TEST_MAX_INPUT = 10000

  def setup
    @quickunion = Quickunion.new
  end

  def test_that_array_is_properly_initialized
    random_num = rand(0..TEST_MAX_INPUT)
    assert_equal random_num, quickunion[random_num]
  end

  def test_that_unconnected_elements_are_not_connected
    refute quickunion.connected?(2, 3)
  end

  def test_that_pair_can_be_connected
    quickunion.connect 2, 3
    assert quickunion.connected?(2, 3)
  end

  def test_that_pair_can_be_distantly_connected
    quickunion.connect 2, 3
    quickunion.connect 3, 4
    quickunion.connect 1, 2
    assert quickunion.connected?(1, 4)
  end

  def test_that_array_can_be_printed_accurately
    quickunion.connect 2, 3
    quickunion.connect 3, 4
    quickunion.connect 1, 2
    output = <<-END.gsub(/^ {6}/, '')
      0     => 0
      1     => 4
      2     => 3
      3     => 4
      4     => 4
      5     => 5
      6     => 6
      7     => 7
      8     => 8
      9     => 9
      10    => 10
    END
    assert_output(output) { quickunion.print_db(0..10) }
  end
end