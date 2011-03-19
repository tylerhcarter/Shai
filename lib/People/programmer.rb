module People
  class Programmer < Person

    def initialize name, house, key
      @name = name

      if !house.respond_to? :lock
        raise "Person::Initalize must recieve a house as a #2 parameter"
      end

      @key = key
      house.lock

      @house = house

      @money = MoneyStorage.new name, PROGRAMMER_START_MONEY

    end

    def act house
    end

  end
end