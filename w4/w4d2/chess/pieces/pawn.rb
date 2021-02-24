require_relative 'piece.rb'

class Pawn < Piece 

  MOVES = [
    [1, 0],
  ]

  def symbol
    ♙
    ♟
  end
  
end
