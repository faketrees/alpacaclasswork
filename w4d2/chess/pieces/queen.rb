require_relative 'piece.rb'

class Queen < Piece 

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

  def initialize
    
  end
  
end
