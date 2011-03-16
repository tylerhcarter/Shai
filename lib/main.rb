require 'House.rb'
require 'Person.rb'
require 'Thief.rb'
require 'World.rb'
require 'Bank.rb'
require 'Events.rb'
require 'advanced_key.rb'

world = World.new

# First Everyone gets a key
BrianKey = Key.new rand 100
TylerKey = Key.new rand 100
LoganKey = Key.new rand 100
GarrisonKey = Key.new rand 100

BrianHouse = House.new "Brian"
TylerHouse = House.new "Tyler"
LoganHouse = House.new "Logan"
GarrisonHouse = House.new "Garrison"

BrianHouse.setKey BrianKey
TylerHouse.setKey TylerKey
LoganHouse.setKey LoganKey
GarrisonHouse.setKey GarrisonKey

Brian     = Thief.new "Brian", BrianHouse, BrianKey, 1000
Tyler     = Thief.new "Tyler", TylerHouse, TylerKey, 1000
Logan     = Thief.new "Logan", LoganHouse, LoganKey, 1000
Garrison  = Thief.new "Garrison", GarrisonHouse, GarrisonKey, 1000

# Add everyone to the world
world.add_person Brian, Tyler, Logan, Garrison
world.add_house BrianHouse, TylerHouse, LoganHouse, GarrisonHouse

Events.mute

attempts_to_run = 1000
world.run attempts_to_run
world.show_results

Events.print_stats