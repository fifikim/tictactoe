# frozen_string_literal: true

require_relative 'board'

class Move
  attr_reader :current_player, :input, :board, :index

  def initialize(current_player, input, board)
    @current_player = current_player
    @input = input
    @board = board
    @index = convert_to_index(input)
  end

  def record
    if move.valid?
      record_move
    else
      invalid_move
    end
  end

  def record_move
    board.record_move(current_player, move.index)
  end

  def invalid_move
    message = 'Invalid move! Please try again.'
    console.output(message)
    take_turn
  end

  def valid?
    valid_char? && free_space?
  end

  private

  def valid_char?
    /^([1-9])$/.match(input) != nil
  end

  def convert_to_index(_string)
    input.to_i - 1
  end

  def free_space?
    board.spaces[index].is_a? Integer
  end
end
