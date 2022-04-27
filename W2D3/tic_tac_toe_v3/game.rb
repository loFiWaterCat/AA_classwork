require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
  def initialize(n, players)
    @player_marks = []
    players.each do |mark, computer|
      if !computer
        @player_marks << HumanPlayer.new(mark)
      else
        @player_marks << ComputerPlayer.new(mark)
      end
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
      position = @current_p.get_position(@board.legal_positions)
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

