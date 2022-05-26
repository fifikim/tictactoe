# frozen_string_literal: true

require_relative 'players'
require_relative 'player_builder'

class PlayersBuilder
  def self.build(ordered_players, markers)
    player1 = PlayerBuilder.build(ordered_players[0], markers[0])
    player2 = PlayerBuilder.build(ordered_players[1], markers[1])
    Players.new([player1, player2])
  end
end
