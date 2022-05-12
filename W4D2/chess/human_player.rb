require_relative "player.rb"

class HumanPlayer < Player

    def initialize(color, display)
        super
    end

    def make_move(board)
        start_pos = []
        end_pos = []
        prev = @display.cursor.selected
        while prev == @display.cursor.selected
            @display.print
            @display.debug_info
            puts "Start pos: #{start_pos}"
            puts "End pos: #{end_pos}"
            puts "Cursor state: #{@display.cursor.selected}"
            puts "Prev : #{prev}"
            prev = @display.cursor.selected
            @display.cursor.get_input
        end
        start_pos = @display.cursor.cursor_pos
        prev = true
        while prev == @display.cursor.selected
            @display.print
            @display.debug_info
            puts "Start pos: #{start_pos}"
            puts "End pos: #{end_pos}"
            puts "Cursor state: #{@display.cursor.selected}"
            prev = @display.cursor.selected
            @display.cursor.get_input
        end
        end_pos = @display.cursor.cursor_pos
        puts "start and end pos from human player: #{[start_pos, end_pos]}"
        [start_pos, end_pos]
    end
end