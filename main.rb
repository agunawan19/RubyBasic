# frozen_string_literal: true

#
# Main
#
require_relative 'animal'
require_relative 'dog'
require_relative 'german_shepard'
require_relative 'human'
require_relative 'smart'
require_relative 'bird'
require_relative 'cardinal'
require_relative 'parrot'

cat = Animal.new
# cat.set_name('Peekaboo')
cat.name = 'Peekaboo'

# puts cat.get_name
puts cat.name

cat.name = 'Sophie'
puts cat.name

cat.name = 1234
puts cat.name

rover = Dog.new
rover.name = 'Rover'
puts rover.name

max = GermandShepard.new
max.name = 'Max'

printf "%s goes %s (using printf)\n", max.name, max.bark
puts "#{max.name} goes #{max.bark} (using interpolation)"

# Class Scientist
class Scientist
  include Human
  prepend Smart

  attr_reader :age

  def initialize(name = '', age = -1)
    @name = name
    @age = age
  end

  def act_smart
    'E = mc^2'
  end
end

einstein = Scientist.new('Albert')

puts "#{einstein.name} #{einstein.age}"

einstein.run

puts "#{einstein.name} says #{einstein.act_smart}"

pascal = Scientist.new
pascal.name = 'Blaise'
puts "#{pascal.name} says #{pascal.age}"

generic_bird = Bird.new
generic_bird.tweet(Cardinal.new)
generic_bird.tweet(Parrot.new)

puts :derek
puts :derek.class
