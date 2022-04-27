class ComputerPlayer
  attr_reader :mark_value
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    position = legal_positions.sample
    puts "Mark: #{@mark_value} - Position: #{position}"
    position
  end
end
