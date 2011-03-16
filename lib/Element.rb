class Element

  @element_name;
  @children;
  @value;

  def initialize name, value = ""

    @element_name = name
    @value = value
    @children = Array.new

  end

  def to_s

    html = "<" + @element_name + ">"

    @children.each{|child|
      html += child.to_s
    }

    html += @value;

    html += "</" + @element_name + ">"
    return html

  end

  def add child

    @children.push child
    return self

  end

end

html = Element.new "html"
body = Element.new "body"
p = Element.new "p", "This is Text."

body.add p
html.add body
puts html