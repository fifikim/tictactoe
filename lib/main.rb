# frozen_string_literal: true

require_relative 'console'
require_relative 'game_builder'

class Main
  include GameBuilder

  def initialize(console = Console.new)
    @console = console
  end

  def run
    @console.instructions

    game = configure_game
    @console.output("\nStarting new game...\n\n")
    game.play

    @console.output('Thanks for playing! Goodbye.')
  end
end
