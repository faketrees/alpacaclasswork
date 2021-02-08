class KnightPathFinder

    attr_reader :considered_positions

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

    end


    def valid_move?(pos)

    end


    def initialize(starting_pos)
        @considered_positions = [starting_pos] # new position [0,0] - root note   child nodes -[2, 1],[2, -1],[1, 2],[1, -2],[-2, 1],[-2, -1],[-1, 2],[-1, -2]
        #starting position is going to be an x,y coordinate on a chessboard
    end

    def new_move_position(pos)
        if KnightPathFinder.valid_moves(pos) != considered_positions
            considered_positions << pos
        end
        
    end

end


kpf = KnightPathFinder.new([0, 0])

p kpf.new_move_position([3, 4])
