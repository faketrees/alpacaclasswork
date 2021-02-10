class Piece

  attr_writer :pos

  def initialize(color, board, pos)

  end

  def present?
    true
  end

  def to_s
    
  end

  def empty?

  end

  def valid_moves

  end

  def symbol #may delete later

  end

  private
  def move_into_check?(end_pos)

  end

end

class NullPiece
  def present?
    false
  end

  def to_s
    "   "
  end
end
