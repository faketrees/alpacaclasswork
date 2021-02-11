require "singleton"
require_relative "piece"

class NullPiece < Piece

    include Singleton

    def initialize
        # @empty = true
    end

    def symbol
        ' '
    end

    def move
        ' '
    end

    def empty?
        true
    end

end