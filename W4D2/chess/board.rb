require_relative "piece.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "null_piece.rb"
require_relative "pawn.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8) }

        color_init = :w
        row_init = 0
        pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
        (0..7).each do |col|
            new_pos = [row_init, col]
            self[new_pos] = pieces[col].new(color_init, self, new_pos)
        end
        row_init = 1
        (0..7).each do |col|
            new_pos = [row_init, col]
            self[new_pos] = Pawn.new(color_init, self, new_pos)
        end

        color_init = :b
        row_init = 6
        (0..7).each do |col|
            new_pos = [row_init, col]
            self[new_pos] = Pawn.new(color_init, self, new_pos)
        end
        row_init = 7
        (0..7).each do |col|
            new_pos = [row_init, col]
            self[new_pos] = pieces[col].new(color_init, self, new_pos)
        end

        (2..5).each do |row|
            (0..7).each do |col|
                self[[row, col]] = NullPiece.instance
            end
        end

    end

    def rows
        duplicate = @rows.dup
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
        self[start_pos] = NullPiece.instance
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

    def in_check?(color)
      king_pos = nil
      rows.each.with_index do |row, i|
        row.each.with_index do |piece, j|
          if piece.is_a?(King) && piece.color == color
            king_pos = [i, j]
            break
          end
        end
      end

      rows.each do |row|
        row.each do |piece|
          if piece.color != color
            moves = piece.valid_moves
            return true if moves.include?(king_pos)
          end
        end
      end

      false
    end


end
