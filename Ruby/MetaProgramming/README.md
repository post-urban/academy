# Meta Programming - Ruby Tutorial

## 目次
- [Object#send](#Object#send)
- [define_method](#define_method)
- [method_missing](#method_missing)

## Object#send
<a href="./send.rb">実行ファイル</a>  

レシーバーの持つメソッドを動的に実行することができる
第一引数はシンボルか文字列でも指定可能

```ruby
puts 1.send(:+, 2)
# => 3

puts [1, 2, 3, 4, 5].send("slice", 0, 2)
# => [1, 2]
```


## define_method
<a href="./define_method.rb">実行ファイル</a>  

引数で与えたメソッド名の関数を作成可能。
関数の処理内容はブロックで指定する。

```ruby
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
```

## method_missing

<a href="./method_missing.rb">実行ファイル</a>  

引数で与えたメソッド名の関数を作成可能。
関数の処理内容はブロックで指定する。

```ruby
class Alphabet

  private

  def method_missing(name, *args)
    if (:a..:z).include?(name)
      puts "#{name} from method_missing"
      return
    end

    super
  end
 end

 Alphabet.new.a
 # => a from define_method
 
 Alphabet.new.b
 # => b from define_method
 
 Alphabet.new.z
 # => z from define_method
```