require "byebug"

module Slideable
  def valid_moves
    valid_positions = []
    if move_dirs.include?(:square)
      directions = [[0,1], [0,-1], [1,0], [-1,0]]
      directions.each do |direction|
        dx, dy = direction
        valid_positions += grow_unblocked_moves_in_dir(dx, dy)
      end
    end

    if move_dirs.include?(:x)
      directions = [[1,1], [-1,-1], [1,-1], [-1,1]]
      directions.each do |direction|
        dx, dy = direction
        valid_positions += grow_unblocked_moves_in_dir(dx, dy)
      end
    end
    valid_positions
  end


  def grow_unblocked_moves_in_dir(dx, dy)
    valid_positions = []
    x, y = pos
    #debugger
    new_pos = [x + dx, y + dy]
    while @board.valid_pos?(new_pos) && @board[new_pos].color == nil
      valid_positions << new_pos
      x, y = new_pos
      new_pos = [x + dx, y + dy]
    end
    if @board.valid_pos?(new_pos) && @board[new_pos].color != self.color
      valid_positions << new_pos
    end
    valid_positions
  end
end
