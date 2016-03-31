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
end