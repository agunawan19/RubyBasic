# frozen_string_literal: true

def my_map(array, multiplier)
  new_array = []

  # for element in array
  #   new_array.push yield element
  # end

  # array.each do |element|
  #   new_array.push yield(element, multiplier)
  # end
  array.each { |element| new_array.push yield(element, multiplier) }

  new_array
end

puts my_map([4, 6, 8], 5) { |number, multi| number * multi }

# Class Integer
class Integer
  def to_proc
    proc { |obj, _args| (obj % self).zero? }
  end
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select(&3)
puts numbers
