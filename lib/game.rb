# frozen_string_literal: true

require_relative 'board'
require_relative 'players'

class Game
  attr_accessor :board, :players

  def initialize(board = Board.new, players = Players.new)
    @board = board
    @players = players
  end

  def play
    puts board.draw
    puts "\nPlayer #{players.current_player}'s move:"
  end
end
