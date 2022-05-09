require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    queue = [self]
    while !queue.empty?
      first = queue.shift
      first.children.each do |child|
        if child.board.over? && (child.board.winner == evaluator ||
            child.board.winner == nil)
          return false
        else
          queue << child
        end
      end
    end
    return true if queue.empty?
  end

  def winning_node?(evaluator)
    queue = [self]
    while !queue.empty?
      first = queue.shift
      first.children.each do |child|
        if child.board.over? && (child.board.winner == evaluator ||
            child.board.winner == nil)
          return true
        else
          queue << child
        end
      end
    end
    return false if queue.empty?
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    @children = []

    (0..2).each do |row|
      (0..2).each do |col|
        if @board.empty?([row, col])
          new_board = @board.dup
          new_board[[row, col]] = @next_mover_mark
          if @prev_move_pos == nil
            next_mover_mark = :o
          else
            next_mover_mark = @board[@prev_move_pos]
          end
          @children << TicTacToeNode.new(new_board, next_mover_mark, [row, col])
        end
      end
    end
    return @children
  end

end
