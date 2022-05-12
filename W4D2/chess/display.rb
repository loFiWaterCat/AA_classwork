require "colorize"
require_relative "cursor.rb"

class Display
  
  attr_reader :cursor

  def initialize(board, debug = false)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
    @debug = debug
  end

  def render
    system("clear")
    start_pos = []
    end_pos = []
    prev = @cursor.selected
    while true
      print
      debug_info if @debug
      puts "Start pos: #{start_pos}"
      puts "End pos: #{end_pos}"
      puts "Cursor state: #{@cursor.selected}"
      @cursor.get_input
      if @cursor.selected != prev
        prev = @cursor.selected
        if @cursor.selected
          start_pos = @cursor.cursor_pos
        else
          end_pos = @cursor.cursor_pos
          @board.safe_move_piece(start_pos, end_pos)
        end
      end
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

  def debug_info
    white_check = @board.in_check?(:w)
    black_check = @board.in_check?(:b)
    safe_moves = @board[@cursor.cursor_pos].saving_moves
    puts "White check status: #{white_check}"
    puts "Black check status: #{black_check}"
    puts "Cursor's piece safe moves: #{safe_moves}"
  end

end
