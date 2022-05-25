# frozen_string_literal: true

require 'easy_ai_player_builder'
require 'easy_ai_player'

describe EasyAiPlayerBuilder do
  describe '.build' do
    before do
      @test_player = EasyAiPlayerBuilder.build do |builder|
        builder.assign_name('Test Easy Ai Player')
        builder.assign_marker('X')
      end
    end

    it 'creates an instance of Player' do
      expect(@test_player).to be_an_instance_of(EasyAiPlayer)
    end

    it 'gives new Player object the correct name' do
      expect(@test_player.name).to eq('Test Easy Ai Player')
    end

    it 'gives new Player object the correct marker' do
      expect(@test_player.marker).to eq('X')
    end
  end
end
