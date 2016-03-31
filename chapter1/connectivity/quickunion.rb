require 'pry'
require 'pry-nav'

class Quickunion
  MAX_INPUT = 10000

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
    while x != @db[x]
      x = @db[x]
    end
    x
  end
end