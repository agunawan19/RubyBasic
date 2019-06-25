# frozen_string_literal: true

# Class Car
class Car
  attr_accessor :color, :doors

  def initialize
    yield(self)
  end
end

car = Car.new do |c|
  c.color = :Red
  c.doors = 4
end

puts "My car's color is #{car.color} and it's got #{car.doors} doors."
