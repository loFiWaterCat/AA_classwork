require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    super
    @move_dirs = [:x]
  end

  def symbol
    "♝"
  end

  private
  attr_reader :move_dirs
end

