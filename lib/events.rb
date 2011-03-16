
# Single module to handle saying all events
class Events

  @@mute = false

  @@deposits = 0
  @@withdraws = 0
  @@robberies = 0
  @@empty_robberies = 0
  @@low_robberies = 0
  @@med_robberies = 0
  @@high_robberies = 0
  @@failed_robberies = 0
  @@unlocked_robberies = 0

  def self.mute
    @@mute = true
  end

  def self.deposited from, to, amount
    puts from + " deposited $" + amount.to_s + " to " + to if !@@mute
    @@deposits += 1
  end

  def self.withdrew to, from, amount
    puts to + " withdrew $" + amount.to_s + " from " + from if !@@mute
    @@withdraws += 1
  end

  def self.stole to, from, amount, previous_status
    puts to + " stole $" + amount.to_s + " from " + from if !@@mute
    @@robberies += 1

    if amount == 0
      @@empty_robberies += 1
    elsif amount < 50
      @@low_robberies += 1
    elsif amount < 200
      @@med_robberies += 1
    else
      @@high_robberies += 1
    end

    if previous_status == false
      @@unlocked_robberies += 1
    end
  end

  def self.fail_steal thief, victim
    puts thief + " failed to break into " + victim + "'s house." if !@@mute
    @@failed_robberies += 1
  end

  def self.print_stats

    puts "Deposits " + @@deposits.to_s
    puts "Withdraws " + @@withdraws.to_s
    puts "Robberies " + @@robberies.to_s + " (Empty: " + @@empty_robberies.to_s + ", Low: " + @@low_robberies.to_s + ", Medium: " + @@med_robberies.to_s + ", High: " + @@high_robberies.to_s + ")"
    puts "Failed Robberies " + @@failed_robberies.to_s
    puts "Unlocked Robberies " + @@unlocked_robberies.to_s

  end
  
end
