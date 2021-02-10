require_relative 'piece.rb'


class Knight < Piece

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

    def initialize(color, board, pos)
        

    end

end