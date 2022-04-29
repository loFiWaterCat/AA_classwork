class Passenger
  attr_reader :name

  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(str)
    return true if @flight_numbers.include?(str.upcase)
    false
  end

  def add_flight(str)
    return if has_flight?(str)
    @flight_numbers << str.upcase
  end

end
