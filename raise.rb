# frozen_string_literal: true

def check_age(age)
  raise ArgumentError, 'Enter Positive Number' unless age.positive?
end

# begin
#   check_age(0)
# rescue ArgumentError
#   puts 'That is an impossible age'
# end

print 'Enter age: '
age = gets.to_i

check_age(age)
