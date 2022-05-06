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

end
