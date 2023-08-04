class PolyTreeNode
    attr_reader :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    # p self
    # p node
   

    if @parent
        i = 0
        @parent.children.each_with_index { |child, j| i == j if child == node } 
        @parent.children.delete_at(i)
    end
    

    @parent = node
    
    if !self.parent.nil?
        if !node.children.include?(self) 
            node.children << self 
        end
    end
  end
end