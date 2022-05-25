# frozen_string_literal: true

require_relative 'human_player_builder'
require_relative 'easy_ai_player_builder'

module PlayerSelector
  PLAYER_OPTIONS = {
    '1' => [
      { builder_type: HumanPlayerBuilder, name: 'Player 1' },
      { builder_type: HumanPlayerBuilder, name: 'Player 2' }
    ],
    '2' => [
      { builder_type: EasyAiPlayerBuilder, name: 'Computer' },
      { builder_type: HumanPlayerBuilder, name: 'Player 1' }
    ]
  }.freeze

  def select_players
    player_type = $stdin.gets.strip

    if PLAYER_OPTIONS.include? player_type
      PLAYER_OPTIONS[player_type]
    else
      @console.menu_error
      select_players
    end
  end
end
