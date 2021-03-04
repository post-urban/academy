class C
  def say_hi
    puts "hi"
  end
end

c = C.new
c.say_hi  # => hi
# c.say_hello  # => undefined method `say_hello' for #<C:0x00007fed9a868ca8> (NoMethodError)


# Cはすでに定義済みなので拡張される
class C
  def say_hello
    puts "hello"
  end
end

c = C.new
c.say_hi  # => hi
c.say_hello  # => hello
