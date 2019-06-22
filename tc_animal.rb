require_relative "./animal"
require "test/unit"

class TestAnimal < Test::Unit::TestCase

    def test_simple
        # assert_equal(4, SimpleNumber.new(2).add(2) )
        # assert_equal(6, SimpleNumber.new(2).multiply(3) )
        result = Animal.new
        result.set_name("Peekaboo")

        :Peekaboo

        assert_equal(:Peekaboo.to_s, result.name)
    end

end
