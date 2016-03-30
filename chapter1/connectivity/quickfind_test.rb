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
end