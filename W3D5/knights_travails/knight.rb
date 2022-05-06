require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :root_node

  def initialize(pos)
    @start = pos
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
  end

  def self.valid_moves(pos)
    
  end
  def new_move_positions
  end
end
