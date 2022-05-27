# frozen_string_literal: true

require_relative 'game_builder'
require_relative 'player_selector'
require_relative 'order_selector'
require_relative 'board_selector'
require_relative 'input'

class ConfigSelector
  def initialize(console)
    @console = console
  end

  def select_options
    @console.player_menu
    unordered_players = choose_players

    @console.order_menu(unordered_players)
    ordered_players = choose_order(unordered_players)

    @console.board_menu
    board = choose_board

    GameBuilder.build do |builder|
      builder.board(board)
      builder.players(ordered_players)
      builder.console(@console)
    end
  end

  private

  def choose_players
    player_choice = Input.get

    if PlayerSelector.validate(player_choice)
      PlayerSelector.record(player_choice)
    else
      @console.menu_error
      choose_players
    end
  end

  def choose_order(unordered_players)
    order_choice = Input.get

    if OrderSelector.validate(order_choice)
      OrderSelector.record(order_choice, unordered_players)
    else
      @console.menu_error
      choose_order(unordered_players)
    end
  end

  def choose_board
    order_choice = Input.get

    if BoardSelector.validate(order_choice)
      BoardSelector.record(order_choice)
    else
      @console.menu_error
      choose_board
    end
  end
end
