require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
  def initialize(p1_mark, p2_mark)
    @player_1 = HumanPlayer.new(p1_mark)
    @player_2 = HumanPlayer.new(p2_mark)
    @current_p = @player_1
    @board = Board.new
  end

  def switch_turn
    if @current_p == @player_1
      @current_p = @player_2
    else
      @current_p = @player_1
    end
  end

  def play
    over = false
    while @board.empty_positions? && !over
      @board.print
      position = @current_p.get_position
      mark = @current_p.mark_value
      @board.place_mark(position, mark)

      if @board.win_row?(mark) ||
          @board.win_col?(mark) ||
          @board.win_diagonal?(mark)
        player_number = 1
        if @current_p == @player_2
          player_number = 2
        end
        puts "Victory to player #{player_number}"
        over = true
      end

      self.switch_turn
    end
  end
end

