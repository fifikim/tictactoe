# frozen_string_literal: true

require_relative 'human_player'
require_relative 'easy_ai_player'

class PlayerSelector
  PLAYER_OPTIONS = [
    ['Another player', [HumanPlayer.new('Player 1', 'X'), HumanPlayer.new('Player 2', 'O')]],
    ['Computer', [EasyAiPlayer.new('Player 1 (Computer)', 'X'), HumanPlayer.new('Player 2', 'O')]]
  ].freeze

  def self.validate(selection)
    range = 0...PLAYER_OPTIONS.length
    range.include? selection
  end

  def self.record(selection)
    PLAYER_OPTIONS[selection][1]
  end
end
