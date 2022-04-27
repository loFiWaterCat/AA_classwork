require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player
  def initialize(n)
    @player = Player.new()
    @board = Board.new(n)
    @remaining_misses = (n * n) / 2
  end

  def start_game
    self.board.place_random_ships
    print self.board.size / 4
    print @board.print
  end

  def lose?
    if @remaining_misses <= 0
      print "you lose"
      return true
    else
      return false
    end
  end

  def win?
    if @board.num_ships == 0
      print "you win"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      return true
    else
      false
    end
  end

  def turn
    move = self.player.get_move
    if self.board.attack(move)
      print @remaining_misses
    else
      @remaining_misses -= 1
      print @remaining_misses
    end

    self.board.print
  end
end
