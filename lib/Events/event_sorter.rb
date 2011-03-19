require 'Events/event_filter'

class EventSorter

  def sort events, filter
    results = Array.new

    events.each{|event|
      results.push event if filter.match? event
    }
    
    return results
  end

end
