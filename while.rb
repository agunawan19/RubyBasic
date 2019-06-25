# frozen_string_literal: true

y = 1

while y <= 10
  y += 1
  next unless y.even?

  puts y
end
