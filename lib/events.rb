require 'event_types'
require 'event_printer'
require 'event_filter'

# Single module to handle saying all events
class Events
  include EventTypes

  @@events = Array.new
  def self.record event
    @@events.push event
  end

  def self.paid record
    record PayEvent.new "world", record.to, record.amount
  end

  def self.deposited from, to, amount
    record DepositEvent.new from, to, amount
  end

  def self.withdrew to, from, amount
    record WithdrawEvent.new from, to, amount
  end

  def self.stole to, from, amount, previous_status
    record RobberyEvent.new from, to, amount
  end

  def self.counterfeit to, from, amount, previous_status
    record CounterfeitEvent.new from, to, amount
  end

  def self.fail_breakin thief, victim
    record FailedRobberyEvent.new thief, victim
  end

  def self.burn thief, victim
    record ArsonEvent.new thief, victim
  end

  def self.print_actions
    printer = EventPrinter.new
    printer.print @@events, filter
  end

  def self.get_events
    return @@events
  end

  def self.print_stats
    
  end
  
end
