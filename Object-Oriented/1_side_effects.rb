
class Calc
  def add(num)
    @sum ||= 0
    @sum += num
  end
end

calc = Calc.new

puts calc.add(1)
# => 1

puts calc.add(1)
# => 2
