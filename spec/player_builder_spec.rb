# frozen_string_literal: true

require 'player_builder'
require 'player'

describe PlayerBuilder do
  describe '.build' do
    before do
      @test_player = PlayerBuilder.build do |builder|
        builder.assign_name('Test Player')
        builder.assign_marker('X')
      end
    end

    it 'creates an instance of Player' do
      expect(@test_player).to be_an_instance_of(Player)
    end

    it 'gives new Player object the correct name' do
      expect(@test_player.name).to eq('Test Player')
    end

    it 'gives new Player object the correct marker' do
      expect(@test_player.marker).to eq('X')
    end
  end
end
