class EventFilter

  # Limiting properties
  @action
  @player
  @target

  def initialize
    @action = Array.new
    @player = Array.new
    @target = Array.new
  end

  def add_action *values
    values.each{|value|
      @action.push value
    }
  end

  def add_player *values
    values.each{|value|
      @player.push value
    }
  end

  def add_target *values
    values.each{|value|
      @target.push value
    }
  end

  def match? event

    matches_actions = check_action event
    matches_player = check_player event
    matches_target = check_target event

    if @action.size > 0
      return false if !matches_actions
    end

    if @player.size > 0
      return false if !matches_player
    end

    if @target.size > 0
      return false if !matches_target
    end

    return true

  end

  private

  def check_action event
    @action.each{|value|
      return true if event.action == value
    }
    return false
  end

  def check_player event
    @player.each{|value|
      return true if event.player == value
    }
    return false
  end

  def check_target event
    @target.each{|value|
      return true if event.target == value
    }
    return false
  end

end
