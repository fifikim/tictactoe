# frozen_string_literal: true

require 'game'
require 'board'
require 'player'
require 'players'
require 'console'

describe Game do
  before do
    @board = Board.new
    @players = Players.new([Player.new('Player 1', 'X'), Player.new('Player 2', 'O')])
    @console = Console.new
    @game = Game.new(@board, @players, @console)
  end

  it "initializes as player 1's turn by default" do
    expect(@game.current_player.name).to eq('Player 1')
  end

  it "initializes board to array of numbers" do
    expect(@board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'switches to player 2 after player 1' do
    @game.switch_player
    expect(@game.current_player.name).to eq('Player 2')
  end

  # it 'switches to player 1 after player 2' do
  #   @player = Player.new(2, @board, @console)
  #   @player.switch
  #   expect(@player.current_player).to eq(1)
  # end

  describe '.play' do
    it 'sends take_turn' do
      # TODO
    end

    it 'loops until game_over' do
      # TODO
    end
  end
end

# expect(@console).to receive(:output).with("\nPlayer 1's move:")