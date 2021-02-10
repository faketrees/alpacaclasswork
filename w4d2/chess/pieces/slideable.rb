#grow_unblocked_moves_in_dir(dx,dy)
#each invocation of the method goes 1 direction at a time
#save the positions it can validly move in an array
#recursive until a piece can't move any more
    #off the board
    #can't move through own piece
    #can't move past an opponent piece
#call this in moves method 4 times (1 for each direction) (8 times on the queen)


#create moves method


#move_dirs should just raise an error in this module and should be overridden in a subclass

module Slideable
    HORIZONTAL_DIRS = [
        [1, 0],
        [0, 1],
        [-1, 0],
        [0, -1]
      ]
    
    DIAGONAL_DIRS = [
        [1, 1],
        [1, -1],
        [-1, 1],
        [-1, -1]
      ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagnonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves = []

        move_dirs.each do |move|
            all_moves << grow_unblocked_moves_in_dir(move[0], move[1])
        end

        all_moves
    end
    
    private
    def move_dirs
        raise "hell"
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        cx = pos[0] #integer
        cy = pos[1] #integer
        pos_copy = [cx, cy]

        pos_moves = []

        while board.valid_position?(pos_copy)
            if board[cx, cy].empty?
                cx += dx 
                cy += dy 
                # pos_moves << pos_copy
                pos_moves << [cx, cy]
            else
                break
            end
        end

        pos_moves
    end

end