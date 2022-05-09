require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :root_node, :considered_positions

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

  ## TODO: Finish build_move_tree
  def build_move_tree

    queue = [@root_node]

    while queue.length > 0
      first = queue.shift
      moves = new_move_positions(first.value)
      moves.each do |pos|
        child = PolyTreeNode.new(pos)
        first.add_child(child)
        queue << child
      end
    end
  end

  def find_path(end_pos)
    self.build_move_tree
    node = @root_node.dfs(end_pos)
    return trace_path_back(node) + [end_pos]
  end

  def trace_path_back(node)
    new_arr = []
    parent_node = node.parent
    while parent_node != nil
      new_arr << parent_node.value
      node = parent_node
      parent_node = node.parent
    end
    return new_arr.reverse
  end

end
