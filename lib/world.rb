class World

  @people
  @houses

  def initialize
    @people = Array.new
    @houses = Array.new
  end

  # Add a person to the world
  def add_person *people
    people.each{
      |person|
      @people.push person
    }
  end

  # Add a house to the world
  def add_house *houses
    houses.each{
      |house|
      @houses.push house
    }
  end

  def run

    # Each person gets a chance to act on a house
    @people.each{
      |person|

      act person
    }

    # Each person now needs to grab any money from their house
    @people.each{
      |person|

      person.retrieve_money
    }

    @people.each{
      |person|

      puts person.name + " has " + person.money.total.to_s;
    }

  end

  private

  # Cause a person to act on a random house
  def act person

    num = rand @houses.size() - 1
    house = @houses[num]

    person.act house

  end

end
