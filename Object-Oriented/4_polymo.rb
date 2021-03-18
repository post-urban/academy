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

class HAML < Renderer
  def format(text)
    "%h1.title #{text}"
  end
end


class LayoutGenerator
  # GOOD: ポリモーフィズムを考えてRendererを継承しているクラスなら使える汎用的なメソッドになっている
  def create_view(text, renderer:)
    if renderer.superclass != Renderer
      raise Exception, "rendererにはRendererクラスの子クラスを渡してください。"
    end

    renderer.new.format(text)
  end

  # BAD: 出力したいフォーマットごとにメソッドを作る必要があり、LayoutGeneratorが汎用的でない
  def create_html(text)
    HTML.new.format(text)
  end

  def create_slim(text)
    SLIM.new.format(text)
  end

  def create_haml(text)
    HAML.new.format(text)
  end
end


layout_generator = LayoutGenerator.new

puts layout_generator.create_view("タイトルです", renderer: HTML)
# => <h1 class='title'>タイトルです</h1>

puts layout_generator.create_view("タイトルです", renderer: SLIM)
# => h1.title タイトルです
