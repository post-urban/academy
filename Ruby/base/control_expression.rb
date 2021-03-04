

puts "================ if ================"
if_value = if true  # ifの返り値をそのまま変数に代入できる
             "TRUE"
           else
             "FALSE"
           end

puts if_value  # => "TRUE"



puts "================ case ================"
case_value = case "ABCDE".size  # caseの返り値をそのまま変数に代入できる
             when 0 .. 5
               "small"
             when 6 .. 10
               "medium"
             else
               "large"
             end

puts case_value  # => "small"



puts "================ 繰り返しから抜け出す（return） ================"
def loop_print_return(count)
  puts "loop start!"

  count.times do |i|
    return if i == 2 # 関数自体から抜けてしまう
    puts "i = #{i}"
  end

  puts "loop finish!"
end

loop_print_return(5)
# => loop start!
# => i = 0
# => i = 1


puts "================ 繰り返しから抜け出す（break） ================"
def loop_print_break(count)
  puts "loop start!"

  count.times do |i|
    break if i == 2 # timesのループが終了する
    puts "i = #{i}"
  end

  puts "loop finish!"
end

loop_print_break(5)
# => loop start!
# => i = 0
# => i = 1
# => loop finish!


puts "================ 繰り返しから抜け出す（next） ================"
def loop_print_next(count)
  puts "loop start!"

  count.times do |i|
    next if i == 2 # timesのループが次の繰り返しにジャンプする
    puts "i = #{i}"
  end

  puts "loop finish!"
end

loop_print_next(5)
# => loop start!
# => i = 0
# => i = 1
# => i = 3
# => i = 4
# => loop finish!
