
class Renderer
  def render(text)
    puts format(text)
  end

  private
  def format(text)
    raise Exception, "Overrideしてください"
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

class HAML < Renderer
  private
  def format(text)
    "%h1.title #{text}"
  end
end

html = HTML.new
html.render("タイトルです")
# => <h1 class='title'>タイトルです</h1>

slim = SLIM.new
slim.render("タイトルです")
# => h1.title タイトルです

haml = HAML.new
haml.render("タイトルです")
# => h1.title タイトルです
