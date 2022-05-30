# frozen_string_literal: true

class BoardSelector
  BOARD_OPTIONS = {
    '1' => 9,
    '2' => 16,
    '3' => 25
  }.freeze

  def self.select
    $stdin.gets.strip
  end

  def self.validate(selection)
    BOARD_OPTIONS.include? selection
  end

  def self.record(selection)
    BOARD_OPTIONS[selection]
  end
end
