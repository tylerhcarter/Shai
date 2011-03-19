require 'settings'
require 'world'
require 'commands'
require 'events'
require 'money_storage'
require 'record'
require 'Items/key'
require 'Items/advanced_key'
require 'People/person'
require 'People/player'
require 'People/thief'
require 'People/counterfeit'
require 'People/worker'
require 'People/arsonist'
require 'People/programmer'
require 'Buildings/enterable'
require 'Buildings/building'
require 'Buildings/burnable'
require 'Buildings/lockable'
require 'Buildings/house'
require 'Buildings/bank'
require 'Events/event_sorter'
require 'Events/event_filter'
require 'Events/event_printer'

Commands.setup

world = World.new

workers = Array["Bill", "Steve", "Bob"]
thieves = Array["Tristan", "Garrison", "Nick"]
counterfeits = Array["Colin", "Soren"]
programmers = Array["Tyler"]

world.create_all workers, People::Worker
world.create_all thieves, People::Thief
world.create_all counterfeits, People::Counterfeit
world.create_all programmers, People::Programmer
world.create "Player", People::Player

world.run MOVES

printer = EventPrinter.new
events = Events.get_events

while true
  puts "Type a name to see actions:"
  input = gets
  input = input.strip

  if input == "stats"
    Events.print_stats
  elsif input == "total"
    world.show_results
  elsif input == "all"
    printer.print_all events
  else
    words = input.split(" ")

    if words.size > 1
      command = words[0].strip
      value = words[1].strip

      filter = EventFilter.new
      if command == "player"
        if words.size == 3
          # All actions of X type done by Y player
          action = words[2].strip
          filter.add_action action
          filter.add_player value
        else
          filter.add_player value
        end
      elsif command == "target"
        if words.size == 3
          # All actions of done by player X to target Y
          player = words[2].strip
          filter.add_target player
          filter.add_player value
        else
          filter.add_target value
        end
      elsif command == "action"
        if words.size == 3
          # All actions of X type applied to Y player
          target = words[2].strip
          filter.add_action value
          filter.add_target target
        else
          filter.add_action value
        end
      else
        if words.size == 2
          filter.add_player command
          filter.add_target value
        elsif words.size == 3
          filter.add_player command
          filter.add_action value
          filter.add_target words[2].strip
        end
      end

      printer.print events, filter
      puts "==========="
    end
  end
  

end
