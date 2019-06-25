# frozen_string_literal: true

# Class Integer
class Integer
  def to_proc
    proc { |obj, _args| (obj % self).zero? }
  end
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select(&2)
puts numbers
