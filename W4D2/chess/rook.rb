require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece
  include Slideable

  def initialize(color, board, pos)
    super
    @move_dirs = [:square]
  end

  def symbol
    if @color == :w
      ♖
    else
      ♜
    end
  end

  private
  attr_reader :move_dirs
end
