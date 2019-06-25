# frozen_string_literal: true

#
# I/O demo
#
Dir.entries('c:/winboard-4.8.0/Stockfish-10-win').each { |file| puts file, ' ' }

file = File.new('authors.txt', 'w')
authors = ['William Shakespeare', 'Agatha Christie', 'Barbara Cartland']
file.puts authors.join("\n")
file.close

puts File.read('authors.txt')
