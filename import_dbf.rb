# frozen_string_literal: true

#
# Class
#
require 'dbf.rb'

path = 'c:/repos/Fox/tutorial/lesson5/data/'
filename = 'country.dbf'
file = File.join(path, filename)

# table = DBF::table.open
data = File.open(file)
table = DBF::Table.new(data)

# returns all file data into rows as an array of hashes with field names as keys
# records = table.map { |record| record.attributes }
records = table.map(&:attributes)

puts 'Print'
table.each do |record|
  puts record.attributes
end

records.each do |row|
  row.each do |key, value|
    puts "#{key}: #{value}"
  end
  puts '---'
end

puts records
