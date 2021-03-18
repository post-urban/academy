class Calc
  def add(num1, num2)
    num1 += num2
  end
end

calc = Calc.new

puts calc.add(1, 2)
puts calc.add(1, 2)
puts calc.add(1, 2)

add = -> (num1, num2) { num1 + num2 }
puts add.call(1, 2)
puts add.call(1, 2)
puts add.call(1, 2)

arr = [1, 2, 3, 4, 5, 6, 7]

under_10 = arr.all? { |num| num <= 10 }

puts "arr: #{arr} under_10: #{under_10}"

