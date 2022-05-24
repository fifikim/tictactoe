# frozen_string_literal: true

require_relative 'console'
require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'players'
require_relative 'easy_ai'

class Main
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

  private

  def configure_game
    board = Board.new
    unordered_players = select_players(board)
    Game.new(board, unordered_players, @console)
  end

  def select_players(board)
    @console.player_menu
    player_type = $stdin.gets

    case player_type
    when '1'
      Players.new(Player.new('Player 1', 'X'), Player.new('Player 2', 'O'))
    when '2'
      Players.new(EasyAiPlayer.new('Computer', 'X'), Player.new('Player 1', 'O'))
    else
      @console.output('Invalid selection! Please try again.')
      select_players(board)
    end
  end
end
