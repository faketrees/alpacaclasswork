require "/Users/michaellyons/Documents/alpacaclasswork/w3d5_poly_tree_nodes/lib/00_tree_node.rb"

class KnightPathFinder

    attr_reader :considered_positions, :current_pos, :starting_pos, :root_node

    MOVES = [
        [2, 1],
        [2, -1],
        [1, 2],
        [1, -2],
        [-2, 1],
        [-2, -1],
        [-1, 2],
        [-1, -2],
    ]

    def self.valid_moves(pos)
        vm = []
        # current_node = PolyTreeNode.new(@current_pos)

        MOVES.each_with_index() do |el,i|
            x = pos[0]
            y = pos[1]
            x += el[0]
            y += el[1]
            if x >= 0 && y >= 0 && x <= 7 && y <= 7
                vm << [x,y] 
            end
        end
        vm
    end


    def valid_move?(pos)

    end


    def initialize(starting_pos)
        @considered_positions = [starting_pos] # new position [0,0] - root note   child nodes -[2, 1],[2, -1],[1, 2],[1, -2],[-2, 1],[-2, -1],[-1, 2],[-1, -2]
        #starting position is going to be an x,y coordinate on a chessboard
        @starting_pos = starting_pos
        @current_pos = starting_pos
        @root_node = PolyTreeNode.new(starting_pos)
        @current_node = start_node
        build_move_tree
    end

    
    def new_move_position(pos)
          test = KnightPathFinder.valid_moves(pos)
          test.reject() {|el| @considered_positions.include?(el)} #[elements that are not in considered_positions]
          test.select() {|el| KnightPathFinder.valid_moves(@starting_pos).include?(el)} #[elements that are not same as the @starting_positions ]

    end

    def build_move_tree
        root_node = PolyTreeNode.new(starting_pos)

   
        nodes = [root_node]
        until nodes.empty?
            current_node = nodes.shift

            current_pos = current_node.value
            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next_node
            end
        end
    end

end


kpf = KnightPathFinder.new([0, 0])

#p kpf.new_move_position([3, 4])


puts
puts "-" * 80
puts

# kpf.new_move_position([1,2])
p 
