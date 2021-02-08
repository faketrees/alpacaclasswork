class KnightPathFinder

    attr_reader :considered_positions, :current_pos, :starting_pos

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

        MOVES.each_with_index() do |el,i|
            x = pos[0]
            y = pos[1]
            x += el[0]
            y += el[1]
            vm << [x,y] if x >= 0 && y >= 0 && x <= 7 && y <= 7
        end
        p(vm)
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
    end

    
    def new_move_position(pos)
          test = KnightPathFinder.valid_moves(pos)
          test.reject() {|el| @considered_positions.include?(el)}
          test.select() {|el| KnightPathFinder.valid_moves(@starting_pos).include?(el)}
          #if KnightPathFinder.valid_moves(pos) != considered_positions && KnightPathFinder.valid_moves(@current_pos).include?(pos) 
            @considered_positions << pos
            @current_pos = pos
          end
        
    end

end


kpf = KnightPathFinder.new([0, 0])

#p kpf.new_move_position([3, 4])
KnightPathFinder.valid_moves([0,0])
