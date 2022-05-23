# frozen_string_literal: true

require_relative 'game'
require_relative 'console'
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
    player1_marker = 'X'
    player2_marker = 'O'
    board = Board.new([player1_marker, player2_marker])
    players = select_players(board, player1_marker, player2_marker)
    Game.new(board, players, @console)
  end

  def select_players(board, player1_marker, player2_marker)
    @console.menu
    player_type = $stdin.gets.strip

    case player_type
    when '1'
      player1 = Player.new('Player 1', player1_marker)
      player2 = Player.new('Player 2', player2_marker)
      Players.new(player1, player2)
    when '2'
      player1 = EasyAiPlayer.new(board)
      player2 = Player.new('Player', player2_marker)
      Players.new(player1, player2)
    else
      @console.output('Invalid selection! Please try again.')
      select_players(board)
    end
  end
end
