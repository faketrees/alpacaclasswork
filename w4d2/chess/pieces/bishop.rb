require_relative 'piece.rb'

class Bishop < Piece

  MOVES = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]

  def initialize

  end
end
