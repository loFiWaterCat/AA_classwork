class Piece
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

    def pos=(val)
        @pos = val
    end

    def symbol

    end

    protected
    attr_reader :color

    private
    attr_reader :pos
    def move_into_check?(end_pos)

    end
end
