require 'person'
require 'events'

module People
  class Arsonist < Person
    def initialize name, house, key
      super name, house, key
    end

    def act house
      if (rand ARSONIST_BURN_CHANCE) == 1
        house.burn
        Events.burn @name, house.owner
      end
    end
  end
end
