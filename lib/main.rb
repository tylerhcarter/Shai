require 'settings'
require 'world'
require 'events'
require 'money_storage'
require 'record'
require 'key'
require 'advanced_key'
require 'person'
require 'thief'
require 'counterfeit'
require 'worker'
require 'arsonist'
require 'programmer'
require 'enterable'
require 'building'
require 'burnable'
require 'lockable'
require 'house'
require 'bank'

world = World.new

#workers = Array["Sarah", "John", "David", "Michael"]
#thieves = Array["Tyler", "Logan", "Garrison", "Miichael", "Pia", "Soren"]
#counterfeits = Array["Maddie", "Sam", "Alex", "Jeff"]
#arsonists = Array["Ned"]
#programmers = Array["Dennis"]

workers = Array["Bill", "Steve"]
thieves = Array["Tristan", "Garrison", "Nick"]
counterfeits = Array["Colin", "Soren"]
programmers = Array["Tyler"]

world.create_all workers, People::Worker
world.create_all thieves, People::Thief
world.create_all counterfeits, People::Counterfeit
#world.create_all arsonists, People::Arsonist
world.create_all programmers, People::Programmer

#bank = Bank.new
#world.add_house bank

Events.mute if !PRINT_ACTIONS

world.run MOVES
puts "--------------------------------------------"
world.show_results if PRINT_SCOREBOARD

#puts bank.total

Events.print_stats