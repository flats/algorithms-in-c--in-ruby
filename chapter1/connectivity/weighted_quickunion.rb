require 'pry'
require 'pry-nav'

##
# An improvement to the quick-union algorithm - page 17.
class Quickunion
  # not great to expose these variables just for testing, but this class
  # really only exists to test this algorithm
  attr_reader :sz, :db
  MAX_INPUT = 10_000

  def initialize
    @db = []
    @sz = []
    0.upto MAX_INPUT do |num|
      @db[num] = num
      @sz[num] = 1
    end
  end

  def [](key)
    @db[key]
  end

  def connect(x, y)
    x_root = find_root(x)
    y_root = find_root(y)
    return if @db[x_root] == @db[y_root]
    if (@sz[x_root] < @sz[y_root])
      @db[x_root] = y_root
      @sz[y_root] += @sz[x_root]
    else
      @db[y_root] = x_root
      @sz[x_root] += @sz[y_root]
    end
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

  def print_sz(range)
    @sz[range].each_with_index do |val, index|
      puts "#{index.to_s.ljust(5)} : #{val}"
    end
  end

  private

  def find_root(x)
    x = @db[x] while x != @db[x]
    x
  end
end