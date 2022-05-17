# frozen_string_literal: true

require_relative 'game'
require_relative 'console'
require_relative 'board'
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

  private

  def start_game
    game = Game.new(Board.new, Players.new, @console)
    game.play
  end
end
