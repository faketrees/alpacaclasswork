require_relative 'piece.rb'

class Rook < Piece 

  MOVES = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]

  def symbol
    "♖"
    "♜"
  end

  private 
  def move_dirs
    
  end
end