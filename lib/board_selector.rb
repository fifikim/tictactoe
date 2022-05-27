# frozen_string_literal: true

require_relative 'board'

class BoardSelector
  BOARD_OPTIONS = {
    '1' => (1..9).to_a,
    '2' => (1..16).to_a,
    '3' => (1..25).to_a
  }.freeze

  def self.select
    $stdin.gets.strip
  end

  def self.validate(selection)
    BOARD_OPTIONS.include? selection
  end

  def self.record(selection)
    Board.new(BOARD_OPTIONS[selection])
  end
end
