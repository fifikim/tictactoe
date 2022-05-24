# frozen_string_literal: true

require_relative 'players'
require_relative 'player_builder'

module PlayersBuilder
  include PlayerBuilder

  def create_players(name1, name2)
    player1 = create_first_player(name1)
    player2 = create_second_player(name2)
    Players.new(player1, player2)
  end
end
