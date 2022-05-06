require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :root_node

  def initialize(pos)
    @start = pos
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
  end

  def self.valid_moves(pos)
    variations = [[1, 2], [2, 1], [1, -2], [-2, 1],
                  [2, -1], [-1, 2], [-1, -2], [-2, -1]]

    valid_pos = []

    variations.each do |move|
      row = pos[0] + move[0]
      col = pos[1] + move[1]
      if row.between?(0, 7) &&
          col.between?(0, 7)
           valid_pos << [row, col]
      end
    end
    valid_pos
  end

  def new_move_positions(pos)
    filtered_pos = KnightPathFinder.valid_moves(pos)
    filtered_pos.select! {|el| !@considered_positions.include?(el)}
    @considered_positions += filtered_pos
    return filtered_pos
  end

  
end
