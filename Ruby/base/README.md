# Base - Ruby Tutorial

## 目次
- [Object](#Object)
- [返り値](#返り値)
- [制御構造](#制御構造)
- [演算子](#演算子)
- [拡張](#拡張)
- [メソッド呼び出し](#メソッド呼び出し)


## Object
Rubyでは、関数やクラス、モジュールなどが全てオブジェクトとして存在する。

## 返り値
<a href="./return.rb">実行ファイル</a>  

Rubyは`return`や`break`がなくても、常に最後に評価した式の値が返り値として返却される。

```ruby
def upcase_add(str1, str2)
  upcase_str1 = str1.upcase
  upcase_str2 = str2.upcase
  upcase_str1 + "_" + upcase_str2 # ここが最終行なのでこの式の評価値が返り値として返却される
end

puts upcase_add("pre", "post") # => "PRE_POST"
```

### return・早期リターン
returnがあった場合その時点でプログラム評価が終了し、返り値として返却される

```ruby
def capitalize_add(str1, str2)
  return "Error" if str1.size == 0
  return "Error" if str2.size == 0

  cap_str1 = str1.capitalize
  cap_str2 = str2.capitalize
  cap_str1 + "_" + cap_str2 # 上でreturnされない場合ここが最終行として評価される
end

puts capitalize_add("pre", "post") # => "Pre_Post"
puts capitalize_add("", "post") # => "Error"
```

## 制御構造
<a href="./control_expression.rb">実行ファイル</a>  

### 制御構造の返り値
Rubyでは制御構造自体も返り値を持つ。  
例えば、`if`や`case`文は返り値を持つので、それをそのまま変数に代入することが可能

```ruby
if_value = if true  # ifの返り値をそのまま変数に代入できる
             "TRUE"
           else
             "FALSE"
           end

puts if_value  # => "TRUE"


case_value = case "ABCDE".size  # caseの返り値をそのまま変数に代入できる
             when 0 .. 5
               "small"
             when 6 .. 10
               "medium"
             else
               "large"
             end

puts case_value  # => "small"
```

### ループからの抜け出しのパターン
- return : メソッドの実行を終了する
- break  : 最も内側のループを脱出する
- next   : 最も内側のループの次の繰り返しにジャンプする

```ruby
def loop_print_return(count)
  puts "loop start!"

  count.times do |i|
    return if i == 2  # 関数自体から抜けてしまう
    puts "i = #{i}"
  end

  puts "loop finish!"
end
# => loop start!
# => i = 0
# => i = 1


def loop_print_break(count)
  puts "loop start!"

  count.times do |i|
    break if i == 2  # timesのループが終了する
    puts "i = #{i}"
  end

  puts "loop finish!"
end
# => loop start!
# => i = 0
# => i = 1
# => loop finish!


def loop_print_next(count)
  puts "loop start!"

  count.times do |i|
    next if i == 2  # timesのループが次の繰り返しにジャンプする
    puts "i = #{i}"
  end

  puts "loop finish!"
end
# => loop start!
# => i = 0
# => i = 1
# => i = 3
# => i = 4
# => loop finish!

```

## 演算子
<a href="./operator.rb">実行ファイル</a>  

他の言語では組み込みの演算子なものがRubyではメソッドとして存在しているものが多い。

### Stringの+演算子は+()でStringクラスのインスタンスメソッドを実行している
```ruby
p "str" + "ing"  # => "string"
p "str".+("ing") # => "string"
```

### 独自の新しい演算子を定義することも可能
```ruby
class String
  def -(other)
    self.delete(other) # otherで指定された文字列を削除する
  end
end

# 演算子のように使えるようになる
puts "string" - "ing" # => "str"
```

## 拡張
<a href="./extension.rb">実行ファイル</a>  

定義済みのクラスを、再度同じように定義することで拡張となる。
```ruby
class C
  def say_hi
    puts "hi"
  end
end

# Cはすでに定義済みなので拡張される
class C
  def say_hello
    puts "hello"
  end
end

c = C.new
c.say_hi  # => hi
c.say_hello  # => hello
```

組み込みのStringクラスArrayクラスなども拡張できる
-> 取り扱いに注意が必要

```ruby
class String
  def -(other)
    self.delete(other) # otherで指定された文字列を削除する
  end
end

puts "string" - "ing" # => "str"
```

## メソッド呼び出し
<a href="./method.rb">実行ファイル</a>  

### ブロック付き呼び出し

> メソッド呼び出しの際に引数と一緒に渡すことのできる処理のかたまり | たのしいRuby P199

専門用語を使うとブロックとはクロージャーのこと。  
`do ... end`もしくは`{ ... }`

### Q. なぜブロックが必要？
A. 制御構文を抽象化したいから  
`for`じゃなくて`each`でファンクショナルに実行できるようになる。
```ruby
for i in [1, 2, 3]
  puts i * 2
end
# => 2
# => 4
# => 6

[1, 2, 3].each { |i| puts i * 2 }
# => 2
# => 4
# => 6
```

### 抽象化して汎用的なメソッドを作れる
```ruby
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
```

### Q. ブロックを2つ受け取るメソッドは作れる？
A. 作れない  
ブロック自体はオブジェクトではなく、使い方に制限がある。  
例えば、処理Aと処理Bを受け取り、その二つの返り値を比較するような関数を作りたい場合ブロックだと実現できない。  
そこで、ブロックをオブジェクトにして扱いやすくしたものが**Procオブジェクト**。

Procオブジェクトはオブジェクトなので変数に入れてやり取りしたり、好きなタイミングで実行したりすることが可能。  
`call`メソッドを呼ぶとProcを実行できる。  

```ruby
def total_diff(range, func1, func2)  # 引数に関数オブジェクトを2つ受け取る
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
```

### ブロックとProcの変換
`&`でブロック→ProcやProc→ブロックの変換が可能。

#### Proc => ブロック
```ruby
def total(&func)
  (1 .. 5).reduce(0) do |total, i|
    total += func.call(i)
  end
end

puts total { |i| i ** 2 }  # ブロックを渡せる
# => 55
```

#### ブロック => Proc
```ruby
def total
  (1 .. 5).reduce(0) do |total, i|
    total += yield(i)
  end
end

proc = Proc.new { |i| i ** 2 }
puts total(&proc)  # Procオブジェクトを渡せる
# => 55
```

### Lambda式
Lambda式はProcの書き方が違うだけ。（識別は可能）  
```ruby
square = lambda { |num| num ** 2 }  # lambda式の書き方1
puts square.call(5)  # => 25

cube = -> (num) { num ** 3 }  # lambda式の書き方2
puts cube.call(5)  # => 125
```

## 名前空間
<a href="./namespace.rb">実行ファイル</a>  

RubyではClassやModuleは名前空間としてスコープ管理にも使える。

```ruby
class Fire
  def mean
    puts self
    puts "火"
  end
end

module Company
  class Fire
    def mean
      puts self
      puts "解雇"
    end
  end
end

Fire.new.mean
# => #<Fire:0x00007febf99206c0>
# => 火

Company::Fire.new.mean
# => #<Company::Fire:0x00007febf9920530>
# => 解雇
```
