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
    while x != @db[x]
      x = @db[x]
    end
    while y != @db[y]
      y = @db[y]
    end
    @db[x] = y;
  end

  def connected?(x, y)

  end

  def print_db(range)
    
  end
end