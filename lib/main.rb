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
    player1_marker = 'X'
    player2_marker = 'O'

    board = Board.new
    unordered_players = select_players(board, player1_marker, player2_marker)
    ordered_players = select_order(unordered_players)

    Game.new(board, ordered_players, @console)
  end

  def select_players(board, player1_marker, player2_marker)
    @console.player_menu
    player_type = $stdin.gets

    case player_type
    when '1'
      [Player.new('Player 1', player1_marker), Player.new('Player 2', player2_marker)]
    when '2'
      [EasyAiPlayer.new(board), Player.new('Player 1', player2_marker)]
    else
      @console.output('Invalid selection! Please try again.')
      select_players(board, player1_marker, player2_marker)
    end
  end

  def select_order(players)
    @console.order_menu(players)
    order = $stdin.gets

    case order
    when '1'
      Players.new(players[0], players[1])
    when '2'
      Players.new(players[1], players[0])
    else
      @console.output('Invalid selection! Please try again.')
      select_order(players)
    end
  end
end
