class EventPrinter
  def print events, filter
    events.each{|event|

      if filter.match? event
        print_event event
      end
    }
  end

  def print_all events
    events.each{|event|
      print_event event
    }
  end

  private

  def print_event event
    if event.kind_of? EventTypes::PayEvent
        pay event
      elsif event.kind_of? EventTypes::DepositEvent
        deposit event
      elsif event.kind_of? EventTypes::WithdrawEvent
        withdraw event
      elsif event.kind_of? EventTypes::RobberyEvent
        robbery event
      elsif event.kind_of? EventTypes::CounterfeitEvent
        counterfeit event
      elsif event.kind_of? EventTypes::FailedRobberyEvent
        failed_robbery event
      elsif event.kind_of? EventTypes::ArsonEvent
        arson event
      end
  end

  def pay event
    puts event.target + " got paid $" + event.amount.to_s
  end

  def deposit event
    puts event.player + " deposited $" + event.amount.to_s + " to " + event.target
  end

  def withdraw event
    puts event.player + " withdrew $" + event.amount.to_s + " from " + event.target
  end

  def robbery event
    puts event.player + " robbed " + event.target + " and stole $" + event.amount.to_s
  end

  def counterfeit event
    puts event.player + " counterfeited $" + event.amount.to_s + " and gave it to " + event.target
  end

  def failed_robbery event
    puts event.player + " failed to break into " + event.target
  end

  def arson event
    puts event.player + " burnt down " + event.target
  end
end
