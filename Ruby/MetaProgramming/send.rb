
puts 1.send(:+, 2)
# => 3

puts [1, 2, 3, 4, 5].send("slice", 0, 2).inspect
# => [1, 2]
