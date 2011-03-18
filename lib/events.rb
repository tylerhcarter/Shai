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

  def self.get_events filter = 0
    if filter == 0
      return @@events
    else
      sorter = EventSorter.new
      return sorter.sort @@events, filter
    end
  end

  def self.print_stats
    
    

  end

  private

  def print_robbery_count
    # Sort Robberies
    filter = EventFilter.new
    filter.add_action "robbery"
    robberies = get_events filter

    total_robbed = 0
    empty_robberies = 0
    low_robberies = 0
    med_robberies = 0
    high_robberies = 0

    robberies.each{
      |event|
      amount = event.amount

      if amount == 0
        empty_robberies += 1
      elsif amount < 50
        low_robberies += 1
      elsif amount < 200
        med_robberies += 1
      else
        high_robberies += 1
      end

      total_robbed += amount
    }

    puts "Total Robberies: " + robberies.size.to_s + " (Empty: " + empty_robberies.to_s + ", " + "Low: " + low_robberies.to_s + ", " + "Medium: " + med_robberies.to_s + ", " + "High: " + high_robberies.to_s + ")"
    puts "Amount Robbed: $" + total_robbed.to_s
  end
  
end
