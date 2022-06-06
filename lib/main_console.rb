# frozen_string_literal: true

require_relative 'console'
require_relative 'translator'
require_relative 'language_selector'
require_relative 'board_selector'
require_relative 'player_selector'
require 'i18n'

class MainConsole < Console
  def welcome
    welcome_msg = translate(:welcome)
    output(welcome_msg)
  end

  def marker_prompt(player)
    player_name = translate(player.name)
    marker_prompt = I18n.t('prompt.marker', player: player_name)
    output(marker_prompt)
  end

  def menu_error
    error_msg = translate('error.menu')
    output(error_msg)
  end

  def marker_error(type)
    error_msg = translate("error.marker.#{type}")
    output(error_msg)
  end

  def language_menu
    language_prompt = translate('prompt.language')
    output(language_prompt)

    output(language_types)
  end

  def player_menu
    player_prompt = translate('prompt.player')
    output(player_prompt)

    output(player_types)
  end

  def order_menu(unordered_players)
    order_prompt = translate('prompt.order')
    output(order_prompt)

    menu = order_types(unordered_players)
    output(menu)
  end

  def board_menu
    board_prompt = translate('prompt.board')
    output(board_prompt)

    output(board_types)
  end

  def new_game
    msg = translate(:new_game)
    output(msg)
  end

  private
  def list_options(option_type)
    option_type.map.with_index do |(key, _value), index|
      "#{index + 1} - #{translate(key)}\n"
    end.join
  end

  def language_types
    "#{list_options(LanguageSelector::LANGUAGE_OPTIONS)}"
  end

  def player_types
    "#{list_options(PlayerSelector::PLAYER_OPTIONS)}"
  end

  def board_types
    "#{list_options(BoardSelector::BOARD_OPTIONS)}"
  end

  def order_types(unordered_players)
    "1 - #{translate(unordered_players[0].name)}\n" \
    "2 - #{translate(unordered_players[1].name)}\n"
  end
end
