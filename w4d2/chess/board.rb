


require_relative "piece"

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
  end


  def [](pos) #pos should be an array
    x, y = pos[0], pos[1]

    @grid[x][y]

  end


  def []=(pos, value) #value should be the piece, either a physical piece or a null piece
    x, y = pos[0], pos[1]

    @grid[x][y] = value
  end


  def move_piece(start_pos, end_pos) #will need to add color back eventually?
    @grid[start_pos] = 


  end


  def valid_position?(pos)

  end


  def add_piece(piece, pos)

  end


  def checkmate?(color)

  end


  def in_check?(color)

  end
  
  def find_king(color)

  end


  def pieces

  end


  def dup

  end


  def move_piece!(color, start_pos, end_pos)

  end


  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def rows
    @grid
  end
end
