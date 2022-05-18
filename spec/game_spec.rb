# frozen_string_literal: true

require 'game'
require 'board'
require 'player'
require 'players'
require 'console'
require 'stringio'

describe Game do
  before do
    @console = Console.new
    @players = Players.new([Player.new('Player 1', 'X'), Player.new('Player 2', 'O')])
    $stdout = StringIO.new
  end

  context 'when starting a new game' do
    before do
      @board = Board.new
      @game = Game.new(@board, @players, @console)
    end

    it "initializes as player 1's turn by default" do
      expect(@game.current_player.name).to eq('Player 1')
    end

    it 'initializes board to array of numbers' do
      expect(@board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  context 'during regular gameplay' do
    describe 'when Player 1 wins' do
      it 'loops until winning combo is recorded and then declares Player 1 as the winner' do
        @board = Board.new([1, 'X', 'X', 4, 'O', 'X', 'X', 8, 'O'])
        @game = Game.new(@board, @players, @console)

        allow($stdin).to receive(:gets).and_return('8', '4', '1')

        @game.play
        output = $stdout.string.split("\n")

        expect(output.last).to eq('Game over! Player 1 wins!')
      end
    end

    describe 'when Player 2 wins' do
      it 'loops until winning combo is recorded and then declares Player 2 as the winner' do
        @board = Board.new([1, 'X', 'X', 4, 'O', 'X', 'X', 8, 'O'])
        @game = Game.new(@board, @players, @console)

        allow($stdin).to receive(:gets).and_return('8', '1', '4')

        @game.play
        output = $stdout.string.split("\n")

        expect(output.last).to eq('Game over! Player 2 wins!')
      end
    end

    describe 'when the game is a draw' do
      it 'loops until board is full and then declares a draw' do
        @board = Board.new(['X', 'X', 'O', 'O', 'O', 'X', 7, 8, 9])
        @game = Game.new(@board, @players, @console)

        allow($stdin).to receive(:gets).and_return('7', '9', '8')

        @game.play
        output = $stdout.string.split("\n")

        expect(output.last).to eq("Game over! It's a draw!")
      end
    end
  end

  context 'when invalid input is received' do
    before do
      @board = Board.new(['X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 9])
      @game = Game.new(@board, @players, @console)
    end

    describe 'when occupied space is selected' do
      it 're-prompts player for input until free space is selected' do
        allow($stdin).to receive(:gets).and_return('1', '2', '3', '4', '5', '9')

        @game.play
        output = $stdout.string.split("\n")
        error_messages = output.find_all { |string| string == 'Invalid move! Please select a free space:' }

        expect(error_messages.length).to eq(5)
      end
    end

    describe 'when invalid character is selected' do
      it 're-prompts player for input until valid char is selected' do
        allow($stdin).to receive(:gets).and_return('n', 'n', 'n', 'n', 'n', 'n', '9')

        @game.play
        output = $stdout.string.split("\n")
        error_messages = output.find_all { |string| string == 'Invalid character! Please select an integer from 1-9:' }

        expect(error_messages.length).to eq(6)
      end
    end
  end
end
