require "./pieces/piece"
require "./pieces/nullpiece"


class Board

  attr_reader :grid

  #change 'piece' to respective pieces once we write each class
  STARTING_PIECES_WHITE = [
    wrook1 = Piece.new("white", self, [0,0]),
    wknight1 = Piece.new("white", self, [0,1]),
    wbishop1 = Piece.new("white", self, [0,2]),
    wqueen = Piece.new("white", self, [0,3]),
    wking = Piece.new("white", self, [0,4]),
    wbishop2 = Piece.new("white", self, [0,5]),
    wknight2 = Piece.new("white", self, [0,6]),
    wrook2 = Piece.new("white", self, [0,7]),
  ]
  STARTING_PIECES_BLACK = [
    brook1 = Piece.new("black", self, [7,0]),
    bbishop1 = Piece.new("black", self, [7,1]),
    bknight1 = Piece.new("black", self, [7,2]), 
    bqueen = Piece.new("black", self, [7,3]),
    bking = Piece.new("black", self, [7,4]),
    bknight2 = Piece.new("black", self, [7,5]),
    bbishop2 = Piece.new("black", self, [7,6]),
    brook2 = Piece.new("black", self, [7,7]),
  ]

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    fill_row(0, STARTING_PIECES_BLACK)
    fill_row(7, STARTING_PIECES_WHITE)
    fill_pawns(1, self, "black")
    fill_pawns(6, self, "white")

  end

  def fill_row(row, color) #this method should be filling in a row of the grid
    @grid[row].each_with_index do |col, idx|
      @grid[row][idx] = color[idx]
    end
  end

  def fill_pawns(row, board, color)
    @grid[row].each_with_index do |col, idx|
      @grid[row][idx] = Piece.new(color, board, [row, idx]) #change this to Pawn.new once we write pawn class
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
    
    if @grid[start_pos[0]][start_pos[1]] != NullPiece.instance && valid_position?([start_pos[0]][start_pos[1]])
      piece = @grid[start_pos]
    else
      raise "There's no piece here. It must be a ghost. Spooky. "
    end
    if valid_position?(end_pos) 
      @grid[end_pos], @grid[start_pos] = @grid[start_pos], @grid[end_pos]
      # @grid[start_pos] = NullPiece.instance     
    else
      raise "You're trying to cheat. *flips table and board"
    end

  end


  def valid_position?(pos)
    #valid position is on the board AKA between 0 and 7
    pos.all? {|el| el >= 0 && el <= 7}

  end

  #populate the board
    #make 2 rows where the pieces are lined up
    #rows 0 and 7

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


a = Board.new
p a

puts
puts "-" * 80
puts

a.move_piece([6,0], [5,0])