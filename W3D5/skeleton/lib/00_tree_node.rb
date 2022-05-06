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
end
