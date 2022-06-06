# frozen_string_literal: true

require_relative 'game_builder'
require_relative 'language_selector'
require_relative 'player_selector'
require_relative 'marker_selector'
require_relative 'order_selector'
require_relative 'board_selector'
require_relative 'input'

class ConfigSelector
  def initialize(console)
    @console = console
  end

  def select_options
    @console.language_menu
    choose_language

    @console.player_menu
    unordered_players = choose_players

    players_with_markers = choose_markers(unordered_players)

    @console.order_menu(players_with_markers)
    ordered_players = choose_order(unordered_players)

    @console.board_menu
    board_size = choose_board

    GameBuilder.build do |builder|
      builder.board(board_size)
      builder.players(ordered_players)
    end
  end

  private

  def choose_language
    language_choice = Input.choose_option

    if LanguageSelector.validate(language_choice)
      locale = LanguageSelector.record(language_choice)
      @console.switch_language(locale)
    else
      @console.menu_error
      choose_language
    end
  end

  def choose_players
    player_choice = Input.choose_option

    if PlayerSelector.validate(player_choice)
      PlayerSelector.record(player_choice)
    else
      @console.menu_error
      choose_players
    end
  end

  def choose_markers(unordered_players)
    markers = []

    @console.marker_prompt(unordered_players[0])
    markers << choose_marker(markers)

    @console.marker_prompt(unordered_players[1])
    markers << choose_marker(markers)

    MarkerSelector.record(unordered_players, markers)
  end

  def choose_marker(selected_markers)
    marker_choice = Input.choose

    if MarkerSelector.wrong_length(marker_choice)
      @console.marker_error('length')
      choose_marker(selected_markers)
    elsif MarkerSelector.number(marker_choice)
      @console.marker_error('number')
      choose_marker(selected_markers)
    elsif MarkerSelector.duplicate(selected_markers, marker_choice)
      @console.marker_error('duplicate')
      choose_marker(selected_markers)
    else
      marker_choice
    end
  end

  def choose_order(unordered_players)
    order_choice = Input.choose_option

    if OrderSelector.validate(order_choice)
      OrderSelector.record(order_choice, unordered_players)
    else
      @console.menu_error
      choose_order(unordered_players)
    end
  end

  def choose_board
    board_choice = Input.choose_option

    if BoardSelector.validate(board_choice)
      BoardSelector.record(board_choice)
    else
      @console.menu_error
      choose_board
    end
  end
end
