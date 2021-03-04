

puts "================ class ================"
class A
  def say_hi
    puts "hi"
  end
end

a = A  # クラス自体がオブジェクトなので変数に代入できる
a_instance = a.new
a_instance.say_hi  # => hi

# 全てのクラスはClassクラスのオブジェクトなのでこのようになる
puts a_instance.class  # => A
puts A.class  # => Class
