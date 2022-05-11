require_relative "piece.rb"
require_relative "stepable.rb"
require_relative "king.rb"

class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        if color == :w
            ♘
        else
            ♞
        end
    end
end