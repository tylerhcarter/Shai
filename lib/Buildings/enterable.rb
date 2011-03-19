module Enterable

  @occupants = Array.new

  def enter person
    @occupants = Array.new if @occupants.nil?
    @occupants.push person
  end

  def exit person
    @occupants.delete person
  end

  def get_occupants
    @occupants = Array.new if @occupants.nil?
    return @occupants
  end

end
