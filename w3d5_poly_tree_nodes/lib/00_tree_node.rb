require 'byebug'

class PolyTreeNode 
    
    def initialize(value, parent = nil)
        @value = value  
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end


    def parent=(spage) # node1 = spage #self = node2 #node2.parent=(node1)
        
        self.parent.children.delete(self) if @parent != nil

        @parent = spage

        self.parent.children << self if !self.parent.nil? && 
        self.parent.children.include?(self) == false
    end

   
    def add_child(child) #node2.parent=(node1)
        #node1.add_child(node2)
        # self.parent=(child)
        child.parent=(self)
    end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "this some bull"
        end
        child.parent=(nil)
    end
  
end