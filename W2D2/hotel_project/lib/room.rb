class Room
  attr_reader :capacity, :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def full?
    return false if @occupants.length < @capacity
    true
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(name)
    if full?
      return false
    else
      @occupants << name
      return true
    end
  end
end
