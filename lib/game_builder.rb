# frozen_string_literal: true

require_relative 'game'
require_relative 'board'
require_relative 'players_builder'

module GameBuilder
  include PlayersBuilder

  def configure_game
    board = Board.new
    
    @console.output("Game Options:\n\n")

    @console.player_menu
    unordered_players = select_players(board)

    @console.order_menu(unordered_players)
    ordered_players = select_order(unordered_players)

    Game.new(board, ordered_players, @console)
  end

  private

  def select_players(board)
    player_type = $stdin.gets.strip

    case player_type
    when '1'
      ['Player 1', 'Player 2']
    when '2'
      ['Computer', 'Player 1']
    else
      @console.output('Invalid selection! Please choose from the numbers listed above.')
      select_players(board)
    end
  end

  def select_order(unordered_players)
    order = $stdin.gets.strip

    case order
    when '1'
      create_players(unordered_players[0], unordered_players[1])
    when '2'
      create_players(unordered_players[1], unordered_players[0])
    else
      @console.output('Invalid selection! Please choose from the numbers listed above.')
      select_order(unordered_players)
    end
  end
end
