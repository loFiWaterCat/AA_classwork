class Piece

    attr_reader :color, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    def empty?

    end

    def valid_moves

    end

    def saving_moves
        all_moves = valid_moves
        filtered_moves = all_moves.select do |move|
            duped_board = @board.dup
            duped_board.move_piece(pos, move)
            !duped_board.in_check?(color)
        end
    end

    def pos=(val)
        @pos = val
    end

    def symbol
        " "
    end


    private
    def move_into_check?(end_pos)

    end
end
