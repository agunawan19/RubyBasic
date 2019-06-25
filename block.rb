# frozen_string_literal: true

def my_method
  puts 'reached the top'
  yield
  puts 'reached the bottom'
end

def my_method_with_params
  yield('John', 2)
end

my_method do
  puts 'reached yield'
end

my_method_with_params do |name, age|
  puts "#{name} is #{age} years old"
end

my_method_with_params { |name, age| puts "#{name} is #{age} years old" }
