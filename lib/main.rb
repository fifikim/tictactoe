# frozen_string_literal: true

require_relative 'game'
require_relative 'console'
require_relative 'board'
require_relative 'players'

class Main
  attr_reader :console

  def initialize(console = Console.new)
    @console = console
  end

  def run
    display_instructions
    start_game
  end

  private

  def start_game
    @game = Game.new(board = Board.new, players = Players.new, console)
    @game.play
  end

  def display_instructions
    console.print_instructions
  end
end
