require_relative 'piece.rb'
require_relative 'slideable'


class Bishop < Piece

  include Slideable

  def symbol
    "♗"
    "♝"
  end

  private 
  def move_dirs
    diagnonal_dirs
  end
end
