require_relative 'piece.rb'

class King < Piece 

  MOVES = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1],
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]

    def symbol
        ♔
        ♚
    end

  
end