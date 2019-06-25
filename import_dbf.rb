# frozen_string_literal: true

#
# Open and load dbf file
#
require 'dbf'

path = 'c:/repos/Fox/tutorial/lesson5/data/'
filename = 'country.dbf'
file = File.join(path, filename)

# table = DBF::table.open
data = File.open(file)
table = DBF::Table.new(data)

# returns all file data into rows as an array of hashes with field names as keys
# records = table.map { |record| record.attributes }
records = table.map(&:attributes)
# puts records

records.each do |record|
  record.each do |key, value|
    text = "#{key}: #{value}"
    # output_file.puts text
    puts text
  end
end

# puts 'Print'
# table.each do |record|
#   puts record.attributes
# end

output_file = File.new('country.txt', 'w')
array = []

array.push(table.columns.map(&:name))

table.each do |record|
  # record = record.attributes
  # output_file.puts record.attributes.values.join(',')
  array.push(record.attributes.values)
end

text = array.map do |row|
  row.join(',')
end

output_file.puts text
output_file.close

puts File.read('country.txt')
