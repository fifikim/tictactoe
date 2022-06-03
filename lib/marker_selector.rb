# frozen_string_literal: true

class MarkerSelector
  def self.wrong_length(selection)
    selection.length.zero? || selection.length > 1
  end

  def self.duplicate(markers, selection)
    markers.include? selection
  end

  def self.record(players, markers)
    players[0].marker = markers[0]
    players[1].marker = markers[1]
    players
  end
end
