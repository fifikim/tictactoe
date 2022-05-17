# frozen_string_literal: true

require_relative 'console'
require_relative 'board'

class Move
  attr_accessor :current_player, :board, :console

  def initialize(current_player, board, console)
    @current_player = current_player
    @board = board
    @console = console
  end

  def take
    console.board(board)
    select_space
  end

  private

  def select_space
    console.output("\nPlayer #{current_player}'s move:")
    input = gets.strip
    validate_selection(input)
  end

  def validate_selection(space)
    index = space.to_i - 1

    if invalid? space
      console.output("Invalid character! Please select a number from 1-9.\n\n")
      select_space
    elsif occupied? index
      console.output("Invalid move! Please select a free space.\n\n")
      select_space
    else
      board.record_move(current_player, index)
    end
  end

  def invalid?(input)
    /^([1-9])$/.match(input).nil?
  end

  def occupied?(index)
    !board.spaces[index].is_a? Integer
  end
end
