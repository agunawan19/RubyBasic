# frozen_string_literal: true

a = 1

until a >= 10
  a += 1
  next unless a.even?

  puts a
end
