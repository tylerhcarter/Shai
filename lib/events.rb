
# Single module to handle saying all events
class Events

  @@mute = false

  @@work_money = 0
  @@deposits = 0
  @@withdraws = 0
  @@robberies = 0
  @@amount_stole = 0
  @@empty_robberies = 0
  @@low_robberies = 0
  @@med_robberies = 0
  @@high_robberies = 0
  @@failed_breakin = 0
  @@unlocked_robberies = 0
  @@counterfeits = 0
  @@amount_counterfeitted = 0
  @@houses_burnt = 0

  def self.mute
    @@mute = true
  end

  def self.paid record
    puts record.to + " got paid $" + record.amount.to_s + " for working" if !@@mute
    @@work_money += record.amount.to_i
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
    @@amount_stole += amount

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

  def self.counterfeit to, from, amount, previous_status
    puts to + " counterfeited " + amount.to_s + " and gave it to " + from if !@@mute

    @@counterfeits += 1
    @@amount_counterfeitted += amount

    if previous_status == false
      @@unlocked_robberies += 1
    end
  end

  def self.fail_breakin thief, victim
    #puts thief + " failed to break into " + victim + "'s house." if !@@mute
    @@failed_breakin += 1
  end

  def self.burn thief, victim
    puts thief + " burned down " + victim + "'s house." if !@@mute
    @@houses_burnt += 1
  end

  def self.print_stats

    puts "Money Generation:"
    puts "Pay: $" + @@work_money.to_s
    puts "Counterfeit: $" + @@amount_counterfeitted.to_s
    puts ""
    puts "Deposits: " + @@deposits.to_s
    puts "Withdraws: " + @@withdraws.to_s
    puts ""
    puts "Robberies: " + @@robberies.to_s + " (Empty: " + @@empty_robberies.to_s + ", Low: " + @@low_robberies.to_s + ", Medium: " + @@med_robberies.to_s + ", High: " + @@high_robberies.to_s + ")"
    puts "Failed Breakins: " + @@failed_breakin.to_s
    puts "Unlocked Breakins: " + @@unlocked_robberies.to_s
    puts "Amount Stole: $" + @@amount_stole.to_s
    puts ""
    puts "Houses burnt: " + @@houses_burnt.to_s
  end
  
end
