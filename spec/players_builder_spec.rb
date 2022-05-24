# frozen_string_literal: true

require 'players_builder'
require 'players'

describe PlayersBuilder do
  describe '.create_players' do
    let(:main_double) { Class.new { extend PlayersBuilder } }

    [
      ['Player 1', 'Player 2', Player, Player],
      ['Player 2', 'Player 1', Player, Player],
      ['Computer', 'Player 1', EasyAiPlayer, Player],
      ['Player 1', 'Computer', Player, EasyAiPlayer]
    ].each do |players|
      context "when names are #{players[0]} and #{players[1]}" do
        before do
          @players = main_double.create_players(players[0], players[1])
          @first_player = @players.initial_order[0]
          @second_player = @players.initial_order[1]
        end

        it "creates first player as an instance of #{players[2]}" do
          expect(@first_player).to be_an_instance_of(players[2])
        end

        it "creates second player as an instance of #{players[3]}" do
          expect(@second_player).to be_an_instance_of(players[3])
        end

        it "assigns first player a marker of 'X'" do
          expect(@first_player.marker).to eq('X')
        end

        it "assigns second player a marker of 'O'" do
          expect(@second_player.marker).to eq('O')
        end
      end
    end
  end
end
