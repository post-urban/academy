class C
  def self.say_hi
    puts "hi"
  end
end

C.say_hi  # => hi

class C
  def C.say_hello
    puts "hello"
  end
end

C.say_hello  # => hello
