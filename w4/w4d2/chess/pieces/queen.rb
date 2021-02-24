require_relative 'piece.rb'
require_relative 'slideable'


class Queen < Piece 

  include Slideable

  def symbol
    "♛"
    "♕"
  end

  private 
  def move_dirs
    horizontal_dirs + diagnonal_dirs
  end
end
