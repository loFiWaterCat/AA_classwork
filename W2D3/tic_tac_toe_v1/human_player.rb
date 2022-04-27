class HumanPlayer
  attr_reader :mark_value
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position
    puts "Enter a position. Two numbers seperated by a space."
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
    rescue
      puts "Please enter only two numbers between 0 and 2, inclusive."
      retry
    end

    input
  end
end
