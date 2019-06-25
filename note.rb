# frozen_string_literal: true

# Note class
class Note
  attr_accessor :note

  def initialize(note = nil)
    @note = note
    puts "@note is #{@note}"
  end

  def self.create
    connect
    note = new(yield)
    note.write
    disconnect
  end

  def write
    puts "Writing \"#{@note}\" to the database."
  end

  def self.connect
    puts 'Connecting to the database...'
  end

  def self.disconnect
    puts 'Disconnecting from the database...'
  end
end

Note.create { 'Foo Bar Bar Foo' }
