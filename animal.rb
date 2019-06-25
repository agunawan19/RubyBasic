# frozen_string_literal: true

#
# Class Animal
#
class Animal
  attr_reader :name

  def initialize
    puts 'Creating a New Animal'
  end

  # def new_name(new_name)
  #   @name = new_name
  # end

  # def get_name
  #   @name
  # end

  # Commented out to use att_reader
  # def name
  #   @name
  # end

  def name=(name)
    if name.is_a?(Numeric)
      puts "Name Can't Be A Number"
    else
      @name = name
    end
  end
end
