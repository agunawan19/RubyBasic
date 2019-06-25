# frozen_string_literal: true

my_array = [
  [1, 2, 3, 4],
  [5, 6, 7, 8]
]

# my_array.map { |row| row.join(',') }

# another_array = my_array.map do |row|
#   row.join(',')
# end

another_array = (my_array.map { |row| row.map { |col| col + 1 } }).map do |row|
  row.join(',')
end
# another_array = another_array.map { |row| row.join(',') }

puts another_array
# puts my_array
