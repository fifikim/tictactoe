# frozen_string_literal: true

require 'game'
require 'board'
require 'players'
require 'console'

describe Game do
  before do
    game = Game.new(Board.new, Players.new, Console.new)
  end

  describe '.play' do
    it 'sends take_turn' do
    end

    it 'loops until game_over' do
    end
  end
end
