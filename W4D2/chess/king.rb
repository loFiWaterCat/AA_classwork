require_relative "piece.rb"
require_relative "stepable.rb"
require_relative "knight.rb"

class King < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        "♚"
    end
end