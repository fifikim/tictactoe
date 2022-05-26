# frozen_string_literal: true

require 'player_selector'
require 'human_player_builder'
require 'easy_ai_player_builder'
require 'stringio'

describe PlayerSelector do
  let(:main_double) { Class.new { extend PlayerSelector } }
  describe '.select_players' do

    context "when '1' is selected" do
      before do
        allow($stdin).to receive(:gets).and_return('1')
        @players = main_double.select_players
      end

      it 'returns first hash with builder_type: HumanPlayerBuilder' do
        expect(@players[0][:builder_type]).to eq(HumanPlayerBuilder)
      end

      it 'returns second hash with builder_type: HumanPlayerBuilder' do
        expect(@players[1][:builder_type]).to eq(HumanPlayerBuilder)
      end

      it "returns first hash with name: 'Player 1'" do
        expect(@players[0][:name]).to eq('Player 1')
      end

      it "returns second hash with name: 'Player 2'" do
        expect(@players[1][:name]).to eq('Player 2')
      end
    end

    context "when '2' is selected" do
      before do
        allow($stdin).to receive(:gets).and_return('2')
        @players = main_double.select_players
      end

      it 'returns first hash with builder_type: EasyAiPlayerBuilder' do
        expect(@players[0][:builder_type]).to eq(EasyAiPlayerBuilder)
      end

      it 'returns second hash with builder_type: HumanPlayerBuilder' do
        expect(@players[1][:builder_type]).to eq(HumanPlayerBuilder)
      end

      it "returns first hash with name: 'Player 1'" do
        # TODO: write test

      end

      it "returns second hash with name: 'Player 2'" do
        # TODO: write test

      end
    end

    context 'when an invalid selection is entered' do
      it 'displays an error message prompting player to select again' do
        # TODO: write test

      end
    end
  end
end
