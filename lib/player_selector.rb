# frozen_string_literal: true

class PlayerSelector
  PLAYER_OPTIONS = {
    '1' => ['Player 1', 'Player 2'],
    '2' => ['Computer', 'Player 1']
  }.freeze

  def self.select
    $stdin.gets.strip
  end

  def self.validate(selection)
    PLAYER_OPTIONS.include? selection
  end

  def self.record(selection)
    PLAYER_OPTIONS[selection]
  end
end
