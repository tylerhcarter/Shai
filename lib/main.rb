require 'House.rb'
require 'Person.rb'
require 'Thief.rb'
require 'World.rb'
require 'Bank.rb'

world = World.new

# First Everyone gets a house
BrianHouse = House.new "Brian"
TylerHouse = House.new "Tyler"
LoganHouse = House.new "Logan"

Brian = Thief.new "Brian", BrianHouse
Tyler = Thief.new "Tyler", TylerHouse, 100
Logan = Thief.new "Logan", LoganHouse

# Now, lets create a thief
GarrisonHouse = House.new "Garrison"
Garrison = Thief.new "Garrison", GarrisonHouse

# Add everyone to the world
world.add_person Brian, Tyler, Logan, Garrison
world.add_house BrianHouse, TylerHouse, LoganHouse, GarrisonHouse

world.run
