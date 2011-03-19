require 'thesaurus'
require 'Commands/player_commands'
require 'Commands/house_commands'
require 'Commands/thief_commands'

module People
  class Player < Person

    include PlayerCommands
    include HouseCommands
    include ThiefCommands

    def initialize name, house, key
        @name = name

        if !house.respond_to? :lock
          raise "Person::Initalize must recieve a house as a #2 parameter"
        end

        @key = key
        house.lock

        @house = house

        @money = MoneyStorage.new name, PERSON_START_MONEY
    end

    def act building
      if !building.respond_to? :unlock
        return false
      end
      while true
        puts "What do you want to do?"
        input = gets.strip

        # Translate Synonyms
        input = Commands.translate input

        if input == "finish"
          break
        elsif input == "info"
          show_info
        elsif input == "house"
          show_own_house_info
        elsif input == "building_info"
          show_building_info building
        elsif input == "home"
          building = @house
        elsif input == "rob"
          attempt_robbery building
          break
        elsif input == "burn"
          burn_house building
          break
        elsif input == "unlock"
          unlock_house building
        elsif input == "lock"
          lock_house building
        elsif input == "deposit"
          deposit_house building
        end

      end

      puts "Turn finished."
      puts ""
    end
  end
end
