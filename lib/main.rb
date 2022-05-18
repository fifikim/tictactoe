# frozen_string_literal: true

require_relative 'game'
require_relative 'console'
require_relative 'board'
require_relative 'player'
require_relative 'players'

class Main
  def initialize(console = Console.new)
    @console = console
  end

  def run
    @console.instructions
    start_game
    @console.output('Thanks for playing! Goodbye.')
  end

  def start_game
    players = Players.new([Player.new('Player 1', 'X'), Player.new('Player 2', 'O')])
    game = Game.new(Board.new, players, @console)
    game.play
  end
end
