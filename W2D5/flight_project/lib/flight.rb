class Flight
  attr_reader :passengers

  def initialize(str, capacity)
    @flight_number = str
    @capacity = capacity
    @passengers = []
  end

  def full?
    return true if @passengers.length == @capacity
    false
  end

  def board_passenger(passenger)
    if !self.full? && passenger.has_flight?(@flight_number)
      @passengers << passenger
    end
  end

  def list_passengers
    names = []

    @passengers.each do |passenger|
      names << passenger.name
    end

    names
  end

  def []ind
    @passengers[ind]
  end

  def <<(passenger)
    board_passenger(passenger)
  end

end

