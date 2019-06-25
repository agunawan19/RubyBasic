# frozen_string_literal: true

#
# Animal Test
#
require_relative './animal'
require 'test/unit'

#
# Class TestAnimal
#
class TestAnimal < Test::Unit::TestCase
  def test_animal
    # assert_equal(4, SimpleNumber.new(2).add(2) )
    # assert_equal(6, SimpleNumber.new(2).multiply(3) )
    result = Animal.new
    result.new_name('Peekaboo')

    assert_equal(:Peekaboo.to_s, result.name)
  end
end
