# frozen_string_literal: true

require_relative 'game'
require_relative 'board'
require_relative 'console'
require_relative 'players'
require_relative 'player_selector'
require_relative 'order_selector'

module GameBuilder
  include PlayerSelector
  include OrderSelector

  def configure_game
    @console = Console.new
    @console.output("Game Options:\n")

    @console.player_menu
    unordered_players = select_players

    @console.order_menu(unordered_players)
    ordered_players = select_order(unordered_players)

    players = build_players(ordered_players)

    board = Board.new
    Game.new(board, players, @console)
  end

  private

  def build_players(ordered_players)
    players = ordered_players.map do |player|
      builder_type = player[:builder_type]

      builder_type.build do |builder|
        builder.assign_name(player[:name])
        builder.assign_marker(player[:marker])
      end
    end

    Players.new(players)
  end
end
