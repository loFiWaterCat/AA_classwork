require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
  def initialize(n, *marks)
    @player_marks = []
    marks.each do |mark|
      @player_marks << HumanPlayer.new(mark)
    end
    @current_p = @player_marks[0]
    @board = Board.new(n)
  end

  def switch_turn
    @player_marks = @player_marks.rotate
    @current_p = @player_marks[0]
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
        puts "Victory to player #{mark}"
        over = true
      end

      self.switch_turn
    end
  end
end

