# frozen_string_literal: true

require_relative 'players'

class OrderSelector
  ORDER_OPTIONS = {
    '1' => proc { |players| [players[0], players[1]] },
    '2' => proc { |players| [players[1], players[0]] }
  }.freeze

  def self.validate(selection)
    ORDER_OPTIONS.include? selection
  end

  def self.record(selection, unordered_players)
    ordered_players = ORDER_OPTIONS[selection].call(unordered_players)
    Players.new(ordered_players)
  end
end
