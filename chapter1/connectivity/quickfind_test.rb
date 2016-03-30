#!/usr/bin/env ruby
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'quickfind'

class QuickfindTest < Minitest::Test
  attr_reader :quickfind

  TEST_MAX_INPUT = 10000

  def setup
    @quickfind = Quickfind.new
  end

  def test_that_array_is_properly_initialized
    random_num = rand(0..TEST_MAX_INPUT)
    assert_equal random_num, quickfind[random_num]
  end

  def test_that_unconnected_elements_are_not_connected
    refute quickfind.connected?(2, 3)
  end

  def test_that_pair_can_be_connected
    quickfind.connect 2, 3
    assert quickfind.connected?(2, 3)
  end

  def test_that_pair_can_be_connected_indirectly
    quickfind.connect 2, 3
    quickfind.connect 3, 4
    quickfind.connect 1, 2
    assert quickfind.connected?(1, 4)
  end

  def test_that_array_can_be_printed_accurately
    quickfind.connect 2, 3
    quickfind.connect 3, 4
    quickfind.connect 1, 2
    output = <<-END.gsub(/^ {6}/, '')
      0     => 0
      1     => 4
      2     => 4
      3     => 4
      4     => 4
      5     => 5
      6     => 6
      7     => 7
      8     => 8
      9     => 9
      10    => 10
    END
    assert_output(output) { quickfind.print_db(0..10) }
  end
end