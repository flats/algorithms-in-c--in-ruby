require 'pry'
require 'pry-nav'

class Quickfind
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
    x_val = @db[x]
    y_val = @db[y]
    return if x_val == y_val
    @db.each_with_index do |val, index|
      @db[index] = y_val if val == x_val
    end
    [x, y]
  end

  def connected?(x, y)
    @db[x] == @db[y]
  end

  def print_db(range)
    @db[range].each_with_index do |val, index|
      puts "#{index.to_s.ljust(5)} => #{val}"
    end
  end
end