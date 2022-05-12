require_relative "display.rb"
require_relative "human_player.rb"

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board, true)
        @players = {p1: HumanPlayer.new(:w, @display), p2: HumanPlayer.new(:b, @display)}
        @current_player = @players[:p1]
    end

    def play
        until @board.checkmate?(:b) || @board.checkmate?(:w)
            start_pos, end_pos = @current_player.make_move(@board)
            if @board[start_pos].color == @current_player.color
                @board.safe_move_piece(start_pos, end_pos)
            end
            switch_players
        end
    end

    def switch_players
        if @current_player == @players[:p1]
            @current_player = @players[:p2]
        else
            @current_player = @players[:p1]
        end
    end
end