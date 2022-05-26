# frozen_string_literal: true

require 'player_builder'

describe PlayerBuilder do
  describe '.build' do
    context "when player name is 'Computer'" do
      before do
        @player = PlayerBuilder.build('Computer', 'X')
      end

      it 'creates an instance of EasyAiPlayer' do
        expect(@player).to be_an_instance_of(EasyAiPlayer)
      end

      it 'creates player with the correct name' do
        expect(@player.name).to eq('Computer')
      end

      it 'creates player with the correct marker' do
        expect(@player.marker).to eq('X')
      end
    end

    context "when player name is not 'Computer'" do
      before do
        @player = PlayerBuilder.build('Test Player', 'O')
      end

      it 'creates an instance of HumanPlayer' do
        expect(@player).to be_an_instance_of(HumanPlayer)
      end

      it 'creates player with the correct name' do
        expect(@player.name).to eq('Test Player')
      end

      it 'creates player with the correct marker' do
        expect(@player.marker).to eq('O')
      end
    end
  end
end
