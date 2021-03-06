module Stepable
    def valid_moves
        valid_positions = []
        directions = []
        if self.is_a?(Knight)
            directions = [
                [2, 1],
                [1, 2],
                [-2, 1],
                [1, -2],
                [2, -1],
                [-1, 2],
                [-2, -1],
                [-1, -2]
        ]
        else
            directions = [
                [0, 1],
                [1, 0],
                [0, -1],
                [-1, 0],
                [1, 1],
                [1, -1],
                [-1, -1],
                [-1, 1]
            ]
        end
        directions.each do |direction|
            x, y = pos
            dx, dy = direction
            new_pos = [x + dx, y + dy]
            # need to refactor for NullPiece
            if @board.valid_pos?(new_pos) &&
                (@board[new_pos] == nil || @board[new_pos].color != self.color)
                valid_positions << new_pos
            end
        end
        valid_positions
    end
end
