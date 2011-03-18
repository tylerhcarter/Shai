class World

  @people
  @houses

  def initialize
    @people = Array.new
    @houses = Array.new
  end

  def create name, type
    key = Key.new rand 100
    house = House.new name
    house.setKey key

    person = type.new name, house, key
    add_person person
    add_house house
  end

  def create_all names, type
    names.each{
      |name|
      create name, type
    }
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

  def run times_to_run = 1

    times_ran = 1
    while times_ran <= times_to_run

      # Shuffle the deck
      @people = @people.sort_by {rand}
      @houses = @houses.sort_by {rand}

      # Have people act
      run_actions

      times_ran += 1
    end

  end

  def show_results
    total_money = 0

    @people.each{
      |person|

      onHand = person.money.total
      inHouse = person.house.money.total
      total = onHand + inHouse
      total_money += total
      
      puts person.name + " has $" + total.to_s + " ($" + onHand.to_s + " on hand, $" + inHouse.to_s + " in house)."
    }
    puts "--------------------------------------------"
    puts "Total Money in Economy: $" + total_money.to_s
    puts "Money Started in Economy: $" + (@people.size * PERSON_START_MONEY).to_s
    puts "Total People in Economy: " + @people.size.to_s
    puts "--------------------------------------------"
  end

  private

  # Allow each person to act
  def run_actions
    @people.each{ |person|
      act person
    }
  end

  # Cause a person to act on a random house
  def act person

    num = rand @houses.size() - 1
    house = @houses[num]

    person.act house

  end

end
