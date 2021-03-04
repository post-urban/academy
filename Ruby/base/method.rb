

puts "================ ループ（for） ================"
for i in [1, 2, 3]
  puts i * 2
end
# => 2
# => 4
# => 6



puts "================ ループ（each） ================"
[1, 2, 3].each { |i| puts i * 2 }
# => 2
# => 4
# => 6



puts "================ ブロック付きメソッド ================"
def total(range)
  range.reduce(0) do |total, i|
    if block_given?
      total += yield(i)
    else
      total += i
    end
  end
end

puts total(1 .. 5)
# => 15

puts total(1 .. 5) { |i| i ** 2 }  # 2乗和を求める
# => 55



puts "================ Proc ================"
def total_diff(range, func1, func2)
  total1 = 0
  total2 = 0

  range.each do |i|
    total1 += func1.call(i)
    total2 += func2.call(i)
  end

  total1 - total2
end

cube = Proc.new { |i| i ** 3 }
square = Proc.new { |i| i ** 2 }

puts total_diff(1 .. 5, cube, square)  # 3乗和と2乗和の差を求める
# => 170



puts "================ Block -> Proc ================"
def total(&func)
  (1 .. 5).reduce(0) do |total, i|
    total += func.call(i)
  end
end

puts total { |i| i ** 2 }  # ブロックを渡せる
# => 55



puts "================ Proc -> Block ================"
def total
  (1 .. 5).reduce(0) do |total, i|
    total += yield(i)
  end
end

proc = Proc.new { |i| i ** 2 }
puts total(&proc)  # Procオブジェクトを渡せる
# => 55



puts "================ Lambda ================"
square = lambda { |num| num ** 2 }
puts square.call(5)  # => 25

cube = -> (num) { num ** 3 }
puts cube.call(5)  # => 125
