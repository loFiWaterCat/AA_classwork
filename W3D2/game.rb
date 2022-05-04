require "./board.rb"
require "./card.rb"
require "byebug"
class Game
attr_reader :board
def initialize(size = 4)
  @size = size
  @board = Board.new(size)
  @board.populate
end

def get_input
input = gets.chomp
input = input.split(" ")
input.map! {|ele| ele.to_i}
return input
end

def valid?(pos)
  row, col = pos
  if row < 1 || row > @size || col < 1 || col > @size || pos.length < 2
    return false
  end
  return true
end

def play
  counter = 0
  while @board.win? == false
    counter += 1
    @board.render

  puts "Please enter position. Valid indexes are between 1 and #{@size}"
  input_1 = get_input
  
  while valid?(input_1) == false
    puts "Please enter position. Valid indexes are between 1 and #{@size}"
    input_1 = get_input
  end
    
  letter = @board.reveal(input_1)
  @board.render

  puts "Please enter position. Valid indexes are between 1 and #{@size})"
  input_2 = get_input
  while valid?(input_2) == false
    puts "Please enter position. Valid indexes are between 1 and #{@size})"
    input_2 = get_input
  end

  letter2 = @board.reveal(input_2)
  @board.render

  puts "New round ======================"
    if letter != letter2
      @board.hide(input_1)
      @board.hide(input_2)
    end
  end
  puts "You won in #{counter} turns. Do better next time."
end

end
