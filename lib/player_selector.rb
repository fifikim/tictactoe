# frozen_string_literal: true

require_relative 'human_player'
require_relative 'easy_ai_player'

$PLAYER_OPTIONS = [
  ['Another player', [HumanPlayer.new('Player 1'), HumanPlayer.new('Player 2')]],
  ['Computer', [EasyAiPlayer.new('Player 1 (Computer)'), HumanPlayer.new('Player 2')]]
]

class PlayerSelector
  def self.validate(selection)
    range = 0...$PLAYER_OPTIONS.length
    range.include? selection
  end

  def self.record(selection)
    $PLAYER_OPTIONS[selection][1]
  end
end
