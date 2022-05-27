# frozen_string_literal: true

require_relative 'human_player'
require_relative 'easy_ai_player'

class PlayerSelector
  PLAYER_OPTIONS = {
    '1' => [HumanPlayer.new('Player 1', 'X'), HumanPlayer.new('Player 2', 'O')],
    '2' => [EasyAiPlayer.new('Player 1 (Computer)', 'X'), HumanPlayer.new('Player 2', 'O')]
  }.freeze

  def self.validate(selection)
    PLAYER_OPTIONS.include? selection
  end

  def self.record(selection)
    PLAYER_OPTIONS[selection]
  end
end
