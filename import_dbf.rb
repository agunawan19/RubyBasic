# frozen_string_literal: true

#
# Open and load dbf file
# Refactored version to follow all rubicop suggestions
#
require 'dbf'
require 'rubyXL'

def add_worksheet(name, workbook, counter)
  if counter == 1
    worksheet = workbook[0]
    worksheet.sheet_name = name
  else
    workbook.add_worksheet(name)
    worksheet = workbook[counter - 1]
  end

  worksheet
end

def add_column_headers_to_worksheet(worksheet, table)
  row = 0
  col = 0

  table.column_names.each do |column|
    worksheet.add_cell(row, col, column)
    col += 1
  end
end

def process_column_value(column_value)
  column_value = column_value.to_s.upcase if
    (column_value.instance_of? TrueClass) ||
    (column_value.instance_of? FalseClass)

  column_value
end

def add_record_to_worksheet(worksheet, table)
  return if table.record_count.negative?

  row = 1

  table.each do |record|
    col = 0

    record.to_a.each do |column_value|
      worksheet.add_cell(row, col, process_column_value(column_value))
      col += 1
    end

    row += 1
  end
end

def get_table_from_dbf(path, file)
  full_filename = File.join(path, file)
  data = File.open(full_filename)

  DBF::Table.new(data)
end

def convert_dbf_to_worksheet(path, file, workbook, counter)
  worksheet = add_worksheet(file, workbook, counter)
  table = get_table_from_dbf(path, file)

  add_column_headers_to_worksheet(worksheet, table)
  add_record_to_worksheet(worksheet, table)
end

def convert_all_dbf_to_worksheet(path, workbook, counter)
  Dir
    .entries(path)
    .select! { |file| file.upcase.end_with?('DBF') }
    .each do |file|
      counter += 1

      convert_dbf_to_worksheet(path, file, workbook, counter)
    end
end

def convert_all_dbf_to_excel(path)
  workbook = RubyXL::Workbook.new
  counter = 0

  convert_all_dbf_to_worksheet(path, workbook, counter)

  workbook.write(File.join(path, 'All_Dbf_Files.xlsx'))
end

path = 'D:/PAYROLL/@Sprint-42/NGC - PD-13214'
convert_all_dbf_to_excel(path)

# path = 'c:/repos/Fox/tutorial/lesson5/data/'
# path = 'D:/Payroll/@Sprint-42/ADPPW - PD-3314'
# filename = 'country.dbf'
# file_with_fullpath = File.join(path, filename)
# workbook = RubyXL::Workbook.new
# counter = 0

# workbook = RubyXL::Workbook.new
# worksheet = workbook[0]
# worksheet.sheet_name = 'My Worksheet 1'
# worksheet.add_cell(0, 0, 'A1')
# worksheet.add_cell(0, 1, '', 'A1')
# workbook.add_worksheet('Sheet2')

# table = DBF::table.open
# data = File.open(file_with_fullpath)
# table = DBF::Table.new(data)

# returns all file data into rows as an array of hashes with field names as keys
# records = table.map { |record| record.attributes }
# records = table.map(&:attributes)
# puts records

# records.each do |record|
#   record.each do |key, value|
#     text = "#{key}: #{value}"
#     # output_file.puts text
#     puts text
#   end
# end

# puts 'Print'
# table.each do |record|
#   puts record.attributes
# end

# output_file = File.new('country.txt', 'w')
# array = []

# array.push(table.columns.map(&:name))

# table.each do |record|
#   # record = record.attributes
#   # output_file.puts record.attributes.values.join(',')
#   array.push(record.attributes.values)
# end

# text = array.map do |row|
#   row.join(',')
# end

# output_file.puts text
# output_file.close

# puts File.read('country.txt')
