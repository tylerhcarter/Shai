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
require 'event_sorter'
require 'event_filter'
require 'event_printer'

world = World.new

workers = Array["Bill", "Steve", "Bob"]
thieves = Array["Tristan", "Garrison", "Nick"]
counterfeits = Array["Colin", "Soren"]
programmers = Array["Tyler"]

world.create_all workers, People::Worker
world.create_all thieves, People::Thief
world.create_all counterfeits, People::Counterfeit
world.create_all programmers, People::Programmer

world.run MOVES

printer = EventPrinter.new
sorter = EventSorter.new

events = Events.get_events

while true
  puts "Type a name to see actions:"
  input = gets
  input = input.strip

  if input == "stats"
    Events.print_stats
  elsif input == "all"
    printer.print_all events
  else
    filter = EventFilter.new
    filter.add_player(input)

    printer.print events, filter
    puts "==========="
  end
  

end
