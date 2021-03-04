
# トップレベルに定義することも可能
define_method "say_hi" do
  puts "hi from define_method"
end

say_hi
# => hi from define_method


# クラス内にインスタンスメソッドとして定義することも可能
class C
  define_method "say_hello" do
    puts "hello from define_method"
  end
end

C.new.say_hello
# => hello from define_method


# たった数行でいくつものメソッドを定義することも可能
class Alphabet
  ("a".."z").each do |char|
    define_method char do
      puts "#{char} from define_method"
    end
  end
end

Alphabet.new.a
# => a from define_method

Alphabet.new.b
# => b from define_method

Alphabet.new.z
# => z from define_method
