#!/usr/bin/env ruby
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'weighted_quickunion'

require 'pry'
require 'pry-nav'

class WeightedQuickunionTest < Minitest::Test
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

  def test_that_sedgewick_input_set_creates_correct_db
    quickunion.connect 3, 4
    quickunion.connect 4, 9
    quickunion.connect 8, 0
    quickunion.connect 2, 3
    quickunion.connect 5, 6
    quickunion.connect 2, 9
    quickunion.connect 5, 9
    quickunion.connect 7, 3
    quickunion.connect 4, 8
    quickunion.connect 5, 6
    quickunion.connect 0, 2
    quickunion.connect 6, 1
    quickunion.connect 5, 8
    assert_equal [8, 3, 3, 3, 3, 3, 5, 3, 3, 3, 10], quickunion.db[0..10]
    assert_equal [1, 1, 1, 10, 1, 2, 1, 1, 2, 1, 1], quickunion.sz[0..10]
  end

  def test_that_db_array_can_be_printed_accurately
    quickunion.connect 2, 3
    quickunion.connect 3, 4
    quickunion.connect 1, 2
    output = <<-END.gsub(/^ {6}/, '')
      0     => 0
      1     => 2
      2     => 2
      3     => 2
      4     => 2
      5     => 5
      6     => 6
      7     => 7
      8     => 8
      9     => 9
      10    => 10
    END
    assert_output(output) { quickunion.print_db(0..10) }
  end

  def test_that_sz_array_can_be_printed_accurately
    quickunion.connect 2, 3
    quickunion.connect 3, 4
    quickunion.connect 1, 2
    output = <<-END.gsub(/^ {6}/, '')
      0     : 1
      1     : 1
      2     : 4
      3     : 1
      4     : 1
      5     : 1
      6     : 1
      7     : 1
      8     : 1
      9     : 1
      10    : 1
    END
    assert_output(output) { quickunion.print_sz(0..10) }
  end
end