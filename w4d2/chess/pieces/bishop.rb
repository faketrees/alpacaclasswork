require_relative 'piece.rb'

class Bishop < Piece

  MOVES = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]


  def symbol
    ♗
    ♝
  end

  private 
  def move_dirs
    
  end
end
