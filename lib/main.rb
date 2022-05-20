# frozen_string_literal: true

require_relative 'game'
require_relative 'console'
require_relative 'board'
require_relative 'player'
require_relative 'players'
require_relative 'easy_ai'
require_relative 'combinations'

class Main
  def initialize(console = Console.new)
    @console = console
  end

  def run
    @console.instructions
    @console.menu

    game = configure_game
    @console.output("\nStarting new game...\n\n")
    game.play

    @console.output('Thanks for playing! Goodbye.')
  end

  private

  def configure_game
    board = Board.new
    combinations = Combinations.new.three_in_a_row
    players = select_players(board)
    Game.new(board, players, combinations, @console)
  end

  def select_players(board)
    player_type = $stdin.gets.strip

    case player_type
    when '1'
      player1 = Player.new('Player 1', 'X')
      player2 = Player.new('Player 2', 'O')
      Players.new(player1, player2)
    when '2'
      player1 = EasyAiPlayer.new(board, 'O')
      player2 = Player.new('Player', 'O')
      Players.new(player1, player2)
    else
      @console.output('Invalid selection! Please try again.')
      select_players
    end
  end
end
