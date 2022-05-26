# frozen_string_literal: true

require 'players_builder'

describe PlayersBuilder do
  describe '.build' do
    context "when player name is 'Computer'" do
      before do
        @players = PlayersBuilder.build(['Computer', 'Test Player 1'], %w[X O])
      end

      it 'creates an instance of Players' do
        expect(@players).to be_an_instance_of(Players)
      end

      it 'assigns the first turn to the correct player' do
        expect(@players.first_player.name).to eq('Computer')
      end
    end
  end
end
