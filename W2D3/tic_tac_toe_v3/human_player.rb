class HumanPlayer
  attr_reader :mark_value
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    puts "Player #{mark_value}, enter a position. " \
    "Two numbers seperated by a space."
    begin
      input = gets.chomp.split
      input = input.map do |el|
        el.to_i
      end
      if input.length != 2
        raise
      end
      input.each do |el|
        if !el.is_a? Integer
          raise
        end
      end
      if !legal_positions.include?(input)
        raise
      end
    rescue
      puts "#{input} is not a legal position. The police have been called. " \
        "In the mean time, try again."
      retry
    end

    input
  end
end
