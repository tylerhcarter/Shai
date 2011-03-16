class Dog

  @name = ""

  def speak
    puts "My Name is " + @name
  end

  def setName (name)
    @name = name
  end

end

Wishbone = Dog.new
Wishbone.setName("Wishbone")

Ginger = Dog.new
Ginger.setName("Ginger")

Wishbone.speak
Ginger.speak
