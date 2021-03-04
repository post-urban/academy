
class C
  def say_hi
    puts "hi"
  end
end

c_instance_1 = C.new
c_instance_2 = C.new

# インスタンスメソッドはどちらのインスタンスからも参照可能
c_instance_1.say_hi  # => hi
c_instance_2.say_hi  # => hi


# c_instance_1オブジェクトに特異メソッドを定義
def c_instance_1.say_hello
  "hello"
end

begin
  # 特異メソッドは定義したオブジェクトでのみ参照可能
  c_instance_1.say_hello  # => hello
  c_instance_2.say_hello  # => undefined method `say_hello' for #<C:0x00007f9b7b8685a8> (NoMethodError)
rescue => e
  puts e
end
