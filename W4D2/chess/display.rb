require "colorize"
require_relative "cursor.rb"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    system("clear")
    while true
      print
      @cursor.get_input
      system("clear")
    end
  end

  def print
    system("clear")
    cursor_pos = @cursor.cursor_pos
    @board.rows.each_with_index do |row, i|
      row_str = ""
      row.each_with_index do |piece, j|
        position = piece.pos
        color = piece.color
        symbol = piece.symbol
        symbol_color = nil
        background_color = nil
        if color == :w
          symbol_color = :white
        else
          symbol_color = :black
        end
        if [i, j] == cursor_pos
          if @cursor.selected
            background_color = :light_blue
          else
            background_color = :default
          end
        elsif (i + j).even?
          background_color = :light_green
        elsif (i + j).odd?
          background_color = :green
        end
        row_str += " #{symbol} ".colorize(:color => symbol_color, :background => background_color)
      end
      row_str += " "
      puts row_str
    end
  end

end
