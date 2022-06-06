# frozen_string_literal: true

class BoardSelector
  BOARD_OPTIONS = [
    ['board.3x3', 9],
    ['board.4x4', 16],
    ['board.5x5', 25]
  ].freeze

  def self.validate(selection)
    range = 0...BOARD_OPTIONS.length
    range.include? selection
  end

  def self.record(selection)
    BOARD_OPTIONS[selection][1]
  end
end
