require "./pieces/piece"
require "./pieces/nullpiece"
require "./pieces/bishop"
require "./pieces/queen"
require "./pieces/rook"

require 'byebug'

class Board

  attr_accessor :grid

  #change 'piece' to respective pieces once we write each class
  #[0,0] - true [1,0]- true [2,0] - true ..[7,0] -true
  STARTING_PIECES_WHITE = [
    wrook1 = Rook.new("white", self, [0,0]),
    wknight1 = Piece.new("white", self, [0,1]),
    wbishop1 = Bishop.new("white", self, [0,2]),
    wqueen = Queen.new("white", self, [0,3]),
    wking = Piece.new("white", self, [0,4]),
    wbishop2 = Bishop.new("white", self, [0,5]),
    wknight2 = Piece.new("white", self, [0,6]),
    wrook2 = Rook.new("white", self, [0,7]),
  ]
  STARTING_PIECES_BLACK = [
    brook1 = Rook.new("black", self, [7,0]),
    bbishop1 = Bishop.new("black", self, [7,1]),
    bknight1 = Piece.new("black", self, [7,2]), 
    bqueen = Queen.new("black", self, [7,3]),
    bking = Piece.new("black", self, [7,4]),
    bknight2 = Piece.new("black", self, [7,5]),
    bbishop2 = Bishop.new("black", self, [7,6]),
    brook2 = Rook.new("black", self, [7,7]),
  ]

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    fill_row(0, STARTING_PIECES_WHITE)
    fill_row(7, STARTING_PIECES_BLACK)
    # fill_pawns(1, self, "black")
    # fill_pawns(6, self, "white")

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

  def empty?(pos)
    self[pos].empty?
  end

  def move_piece(start_pos, end_pos) #will need to add color back eventually?
    
    if self[start_pos] != NullPiece.instance && valid_position?(end_pos)
      piece = self[start_pos]
    else
      raise "There's no piece here. It must be a ghost. Spooky. "
    end
    if valid_position?(end_pos) 
        piece.pos = end_pos
        self[end_pos] = piece
        self[start_pos] = NullPiece.instance
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


# a = Board.new
# # p a

# # puts
# # puts "-" * 80
# # puts

# # a.move_piece([6,0], [5,0])
# # print a[[6, 0]]

# a.grid.each_with_index do |row, i1|
#     row.each_with_index do |col, i2|
      
#       puts "grid [#{i1}, #{i2}] :#{a[[i1,i2]].empty?}"
#     end
# end