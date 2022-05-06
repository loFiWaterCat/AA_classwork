require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_node)
        @parent.children.select! {|el| el != self} if @parent != nil

        @parent = new_node
        @parent.children << self if new_node != nil
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "parent is nil" if child_node.parent == nil
        child_node.parent = nil
    end

    def dfs(target_value)
      return self if self.value == target_value
      return nil if self.children == []

      self.children.each do |child|
        stack = child.dfs(target_value)
        return stack if stack != nil
      end

      return nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty?
            first_node = queue.shift
            return first_node if first_node.value == target_value
            queue += first_node.children
        end
        return nil
    end
end
