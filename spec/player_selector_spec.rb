# frozen_string_literal: true

require 'player_selector'
require 'human_player_builder'
require 'easy_ai_player_builder'
require 'stringio'

describe PlayerSelector do
  let(:main_double) { Class.new { extend PlayerSelector } }
  describe '.select_players' do
    before do
      @test_player = PlayerBuilder.build do |builder|
        builder.assign_name('Test Player')
        builder.assign_marker('X')
      end
    end

    context "when '1' is selected" do
      it 'returns first hash with builder_type: HumanPlayerBuilder' do
        # TODO: write test
      end

      it 'returns second hash with builder_type: HumanPlayerBuilder' do
        # TODO: write test
      end

      it "returns first hash with name: 'Player 1'" do
        # TODO: write test
      end

      it "returns second hash with name: 'Player 2'" do
        # TODO: write test
      end
    end

    context "when '2' is selected" do
      it 'returns first hash with builder_type: HumanPlayerBuilder' do
        # TODO: write test
      end

      it 'returns second hash with builder_type: HumanPlayerBuilder' do
        # TODO: write test
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
