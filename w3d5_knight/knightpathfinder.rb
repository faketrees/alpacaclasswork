require "/Users/michaellyons/Documents/alpacaclasswork/w3d5_poly_tree_nodes/lib/00_tree_node.rb"

class KnightPathFinder

    attr_reader :considered_positions, :current_pos, :starting_pos, :start_node

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
            else
                raise "you dun fucked up"
            end
        end

        poly_nodes = vm.each_with_index do |pos_pos, i|
                        vm[i] = PolyTreeNode.new(pos_pos)
                     end
        # return poly_nodes.each do |node|
        #         if @start_node.value == @starting_pos && @start_node.parent.nil?
        #             node.parent=(@start_node)
        #         else 
        #             node.parent=(@current_pos)
        #         end
        #        end
        for i in (0...poly_nodes.length-1)
            poly_nodes[i].parent = @current_node
        end
     # valid moves array should contain all possilbe moves from orgin position
     # if pos was visited, its not a valid move.
    end


    def valid_move?(pos)

    end


    def initialize(starting_pos)
        @considered_positions = [starting_pos] # new position [0,0] - root note   child nodes -[2, 1],[2, -1],[1, 2],[1, -2],[-2, 1],[-2, -1],[-1, 2],[-1, -2]
        #starting position is going to be an x,y coordinate on a chessboard
        @starting_pos = starting_pos
        @current_pos = starting_pos
        @start_node = PolyTreeNode.new(starting_pos)
        @current_node = start_node
    end

    
    def new_move_position(pos)
          test = KnightPathFinder.valid_moves(pos)
          test.reject() {|el| @considered_positions.include?(el)} #[elements that are not in considered_positions]
          test.select() {|el| KnightPathFinder.valid_moves(@starting_pos).include?(el)} #[elements that are not same as the @starting_positions ]
          if test.include?(@current_pos)
                @considered_positions << pos
                @current_pos = pos
                p "piece moved to #{pos}"
          end
    end

    def build_move_tree(pos)   # [0,0] - [4,5]  #=> [0,0] [1,2] [3,3] [4, 5]
                                                #=>       [2,1]
        q = []
        new_pos = new_move_position(pos)
        q.push @starting_pos
        until q.empty?
            current_piece = q[0]

        end
    end

end


kpf = KnightPathFinder.new([0, 0])

#p kpf.new_move_position([3, 4])


puts
puts "-" * 80
puts

# kpf.new_move_position([1,2])
KnightPathFinder.valid_moves([3,3])
