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

  def dfs(target)
    return self if self.value == target 
    
    if self.children.length > 0
        self.children.each do |child| 
            result = child.dfs(target) 
            return result if !result.nil?
        end
    end
    nil  
  end

  def bfs(target)
    queue = [self]
    
    until queue.size == 0
      node = queue.shift
      if node.value == target
        return node
      else
        queue += node.children
        
        # puts "queue"
        # queue.each {|child| p child.value }
        
      end
    end
    nil
  end

  def inspect
    return "value: #{value}, parent: #{parent}, children: #{children}"
  end
end

# return self if self.value == target
# result = nil
# if self.children.length > 0 && 
#     self.children.each do |child|
#         result = child if child.value == target 
#         return result if !result.nil?
#     end
# end
#   if self.children.length > 0
#       self.children.each do |child_2|
#           result = child_2.bfs(target)
#           return result if !result.nil?
#       end
#   end