# frozen_string_literal: true

require 'game_builder'
require 'game'
require 'board'
require 'human_player'
require 'players'
require 'console'

describe GameBuilder do
  before do
    @board = Board.new
    @markers = %w[X O]
    @player1 = HumanPlayer.new('Test Player 1', @markers[0])
    @player2 = HumanPlayer.new('Test Player 1', @markers[1])
    @players = Players.new([@player1, @player2])
    @console = Console.new
    @game = GameBuilder.build do |builder|
      builder.board(@board)
      builder.players(@players)
      builder.console(@console)
      builder.markers(@markers)
    end
  end

  it 'creates a new game object' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'assigns the board to given board' do
    expect(@game.board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'assigns the first turn to the correct player' do
    first_player = @game.current_player
    expect(first_player.name).to eq('Test Player 1')
  end
end
