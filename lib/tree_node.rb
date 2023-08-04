class PolyTreeNode
    attr_reader :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if @parent
        @parent.children.delete(self)
    end
    
    
    @parent = node
    if !self.parent.nil?
        if !node.children.include?(self) 
            node.children << self 
        end
    end
  end
 
  def add_child(node)
    node.parent=(self)
  end

  def remove_child(node)
    raise 'Not a child' if !self.children.include?(node)
    node.parent=(nil)
  end

  

  def inspect
    return "value: #{value}, parent: #{parent}, children: #{children}"
  end
end