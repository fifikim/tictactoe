# frozen_string_literal: true

require_relative 'human_player'
require_relative 'easy_ai_player'

class PlayerSelector
  PLAYER_OPTIONS = [
    ['opponent.human', [HumanPlayer.new('player.human1'), HumanPlayer.new('player.human2')]],
    ['opponent.easy_ai', [EasyAiPlayer.new('player.easy_ai'), HumanPlayer.new('player.human2')]]
  ].freeze

  def self.validate(selection)
    range = 0...PLAYER_OPTIONS.length
    range.include? selection
  end

  def self.record(selection)
    PLAYER_OPTIONS[selection][1]
  end
end
