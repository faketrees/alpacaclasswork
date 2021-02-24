# require_relative "nullpiece"

class Piece

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    # @empty = false
  end

  def present?
    true
  end

  def to_s
    symbol.to_s
  end

  def empty?
    false
  end

  def valid_moves

  end

  def symbol #may delete later
    raise "You haven't created this yet"
  end

  private
  def move_into_check?(end_pos)

  end

end


