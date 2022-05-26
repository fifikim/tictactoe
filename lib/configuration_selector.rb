# frozen_string_literal: true

require_relative 'board'
require_relative 'game_builder'
require_relative 'player_selector'
require_relative 'order_selector'
require_relative 'players_builder'

class ConfigurationSelector
  def initialize(console)
    @console = console
  end

  def select_options
    @console.player_menu
    player_names = choose_players

    @console.order_menu(player_names)
    ordered_players = choose_order(player_names)

    board = Board.new
    markers = %w[X O]

    players = PlayersBuilder.build(ordered_players, markers)

    GameBuilder.build do |builder|
      builder.board(board)
      builder.markers(markers)
      builder.players(players)
      builder.console(@console)
    end
  end

  def choose_players
    player_choice = PlayerSelector.select

    if PlayerSelector.validate(player_choice)
      PlayerSelector.record(player_choice)
    else
      @console.menu_error
      choose_players
    end
  end

  def choose_order(unordered_players)
    order_choice = OrderSelector.select

    if OrderSelector.validate(order_choice)
      OrderSelector.record(order_choice, unordered_players)
    else
      @console.menu_error
      choose_order(unordered_players)
    end
  end
end
