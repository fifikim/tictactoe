# frozen_string_literal: true

require 'human_player_builder'
require 'human_player'

describe HumanPlayerBuilder do
  describe '.build' do
    before do
      @test_player = HumanPlayerBuilder.build do |builder|
        builder.assign_name('Test Human Player')
        builder.assign_marker('X')
      end
    end

    it 'creates an instance of Player' do
      expect(@test_player).to be_an_instance_of(HumanPlayer)
    end

    it 'gives new Player object the correct name' do
      expect(@test_player.name).to eq('Test Human Player')
    end

    it 'gives new Player object the correct marker' do
      expect(@test_player.marker).to eq('X')
    end
  end
end
