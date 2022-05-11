require_relative "piece.rb"

class Board
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        # @null_piece = NullPiece

        # temporary way to initialize pieces on board
        (0..1).each do |row|
            (0..7).each do |col|
                self[[row, col]] = Piece.new(:w, self, [row, col])
            end
        end
        (6..7).each do |row|
            (0..7).each do |col|
                self[[row, col]] = Piece.new(:b, self, [row, col])
            end
        end
    end

    def[](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "No piece at start position" if self[start_pos] == nil
        raise "End position is outside board" if !valid_pos?(end_pos)
        
        piece = self[start_pos]
        legal_moves = piece.valid_moves
        raise "Illegal move" if !legal_moves.include?(end_pos)
        
        piece.pos = end_pos
        self[start_pos] = nil
        self[end_pos] = piece
    end

    def valid_pos?(pos)
        row, col = pos
        if row < 0 || col < 0 || row > 7 || col > 7
            false
        else
            true
        end
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

end