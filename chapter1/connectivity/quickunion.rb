require 'pry'
require 'pry-nav'

##
# A connectivity algorithm with quick unions and slower finds - page 15.
class Quickunion
  MAX_INPUT = 10_000

  def initialize
    @db = []
    0.upto MAX_INPUT do |num|
      @db[num] = num
    end
  end

  def [](key)
    @db[key]
  end

  def connect(x, y)
    return if (@db[x] == @db[y])
    x_root = find_root(x)
    y_root = find_root(y)
    @db[x_root] = y_root
  end

  def connected?(x, y)
    x_root = find_root(x)
    y_root = find_root(y)
    x_root == y_root
  end

  def print_db(range)
    @db[range].each_with_index do |val, index|
      puts "#{index.to_s.ljust(5)} => #{val}"
    end
  end

  private

  def find_root(x)
    x = @db[x] while x != @db[x]
    x
  end
end