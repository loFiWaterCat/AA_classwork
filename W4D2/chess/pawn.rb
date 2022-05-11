require_relative "piece"

class Pawn < Piece

    def initialize(color, board, pos)
        super
    end

    def symbol
        if color == :w
            ♙
        else
            ♟
        end
    end

    def valid_moves
        valid_positions = []
        row, col = pos
        dir = forward_dir
        
        # adding diagonal attacks
        [-1, 1].each do |side|
            new_pos = [row + dir, col + side]
            if @board[new_pos].color != nil && @board[new_pos].color != self.color
                valid_positions << new_pos
            end
        end

        # adding forward moves
        i = 1
        i = 2 if at_start_row?
        while i > 0
            new_pos = [row + dir, col]
            row = new_pos[0]
            if @board[new_pos].color == nil && @board.valid_pos?(new_pos)
                valid_positions << new_pos
            else
                break
            end
            i -= 1
        end

        valid_positions
    end

    private
    def forward_dir
        if color == :w
            return 1
        else
            return -1
        end
    end

    def at_start_row?
        row, col = pos
        if color == :w && row == 1
            return true
        elsif color == :b && row == 6
            return true
        end
        false
    end


end