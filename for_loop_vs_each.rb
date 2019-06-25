# frozen_string_literal: true

numbers = [1, 2, 3, 4, 5]

# for number in numbers
#   puts "#{number}, "
# end
numbers.each do |number|
  print "#{number}, "
end

puts

groceries = ['bananas', 'sweet potatoes', 'pasta', 'tomatoes']

groceries.each do |food|
  puts "Get Some #{food}"
end

(0..5).each do |i|
  puts "# #{i}"
end
