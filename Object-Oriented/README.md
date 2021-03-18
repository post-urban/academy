# オブジェクト指向

## 目次
- [原則](#原則)
- [カプセル化](#カプセル化)
- [継承](#継承)
- [ポリモーフィズム](#ポリモーフィズム)

## 原則

- ### カプセル化
- ### 継承
- ### ポリモーフィズム

## カプセル化
### 副作用という考え方
<a href="./1_side_effects.rb">実行ファイル</a>  

「副作用がある」とは、あるプログラムの出力が入力に対して一意でない状態のこと。
```ruby
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
# addメソッドは引数が同じなのにも関わらず、出力が毎回変わるので「副作用」がある
```

### カプセル化とは
<a href="./2_module.rb">実行ファイル</a>  

独立した機能群をブラックボックス化する。  

>僕は自動車に詳しくないので、自動車のカプセルを開けたら（つまり車を分解したら）バラバラになった自動車を元に戻せなくなるでしょう。しかし、僕はそんな自分では管理しきれない複雑な鉄の塊を運転することができます。なぜなら、ハンドルを操作しアクセルを踏めば前に進むということを知っているからです。

複雑な機能や状態なども、適切に「カプセル化」しブラックボックス化することで、  
誰でも使える汎用的で便利なモジュールとすることができる。

#### ここで大切なことは、それぞれのモジュールが「独立」していること（疎結合）
他のモジュールに依存しない、  
それ自体で独立しているモジュール単位で適切にClassを区切っていくことが大切


#### そして、それぞれもモジュールが最小限であること
一つのモジュール（クラスやメソッド）が一つの役割のみ持っていて、  
それぞれのモジュールが担う「責任」が最小になっている必要があります。

```ruby
# 独立した最小限のクラス
class Engine
  def on
    puts "Engine on"
  end
end

# 独立した最小限のクラス
class Gear
  def change
    puts "Gear change"
  end
end

# 汎用的に使いまわせる
class Car
  def drive
    Engine.new.on
    Gear.new.change
    
    puts "Car drive"
  end
end
```


## 継承
<a href="./3_extension.rb">実行ファイル</a>  

継承とはモジュールごとに共通なパーツをまとめて、別のモジュールとして切り出すこと。  
また、そのモジュールの「規格（Interface）」を作ること。


```ruby
class Renderer
  def render(text)
    puts format(text)
  end

  private
  def format(text)
    raise Error, "Overrideしてください"
  end
end

class HTML < Renderer
  private
  def format(text)
    "<h1 class='title'>#{text}</h1>"
  end
end

class SLIM < Renderer
  private
  def format(text)
    "h1.title #{text}"
  end
end

html = HTML.new
html.render("タイトルです")
# => <h1 class='title'>タイトルです</h1>

slim = SLIM.new
slim.render("タイトルです")
# => h1.title タイトルです
```


## ポリモーフィズム
<a href="./4_polymo.rb">実行ファイル</a>  

ポリモーフィズムとは抽象化のこと。

```ruby
class Renderer
  def format(text)
    raise Error, "Overrideしてください"
  end
end

class HTML < Renderer
  def format(text)
    "<h1 class='title'>#{text}</h1>"
  end
end

class SLIM < Renderer
  def format(text)
    "h1.title #{text}"
  end
end


class LayoutGenerator
  # GOOD: ポリモーフィズムを考えてRendererを継承しているクラスなら使える汎用的なメソッドになっている
  def create_view(text, renderer:)
    renderer.new.format(text)
  end

  # BAD: 出力したいフォーマットごとにメソッドを作る必要があり、LayoutGeneratorが汎用的でない
  def create_html(text)
    "<h1 class='title'>#{text}</h1>"
  end
end


layout_generator = LayoutGenerator.new

puts layout_generator.create_view("タイトルです", renderer: HTML)
# => <h1 class='title'>タイトルです</h1>

puts layout_generator.create_view("タイトルです", renderer: SLIM)
# => h1.title タイトルです
```