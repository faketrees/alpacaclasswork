require_relative "./pieces/piece"

class Board

  attr_reader :grid

  STARTING_PIECES = [
    wrook1 = Piece.new("white", self, [0,0]),
    wrook2 = Piece.new("white", self, [0,7]),
    wbishop1 = Piece.new("white", self, [0,1]),
    wbishop2 = Piece.new("white", self, [0,6]),
    wknight1 = Piece.new("white", self, [0,2]),
    wknight2 = Piece.new("white", self, [0,5]),
    wqueen = Piece.new("white", self, [0,3]),
    wking = Piece.new("white", self, [0,4]),
    brook1 = Piece.new("black", self, [7,0]),
    brook2 = Piece.new("black", self, [7,7]),
    bbishop1 = Piece.new("black", self, [7,1]),
    bbishop2 = Piece.new("black", self, [7,6]),
    bknight1 = Piece.new("black", self, [7,2]),
    bknight2 = Piece.new("black", self, [7,5]),
    bqueen = Piece.new("black", self, [7,3]),
    bking = Piece.new("black", self, [7,4]),
  ]

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    #fill in the top 2 rows and bottom two rows with piece instances. (filler pieces, they don't have to do too much)
  end

  def populate
    STARTING_PIECES.each do |piece|
      grid[*piece.pos] = piece
    end
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
    if @grid[start_pos] != NullPiece && valid_position?(start_pos)
      piece = @grid[start_pos]
    else
      raise "There's no piece here. It must be a ghost. Spooky. "
    end
    if valid_position?(end_pos) 
      @grid[start_pos] = NullPiece.instance
      @grid[end_pos] = piece
    else
      raise "You're trying to cheat. *flips table and board"
    end

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
