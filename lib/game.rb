# frozen_string_literal: true

require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def play
    puts board.draw
  end
end
