# frozen_string_literal: true

require 'game'
require 'human_player'
require 'players'
require 'game_builder'
require 'stringio'
require 'translator'

describe Game do
  before do
    Translator.new.switch_locale(:en)
    @board_size = 9
    @players = Players.new([HumanPlayer.new('player.human1', 'X'), HumanPlayer.new('player.human2', 'O')])
    $stdout = StringIO.new
  end

  context 'when starting a new game' do
    before do
      @game = GameBuilder.build do |builder|
        builder.board(@board_size)
        builder.players(@players)
      end
    end

    it "starts with the correct player's turn" do
      allow($stdin).to receive(:gets).and_return('1', '2', '3', '4', '5', '6', '7')

      @game.play
      output = $stdout.string.split("\n")
      first_prompt = output.find { |string| string.include?('move:') }

      expect(first_prompt).to include("Player 1's move:")
    end

    it 'initializes board to array of numbers' do
      expect(@game.board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  context 'during regular gameplay' do
    describe 'when Player 1 wins' do
      it 'loops until winning combo is recorded and then declares Player 1 as the winner' do
        @game = GameBuilder.build do |builder|
          builder.board(@board_size)
          builder.players(@players)
        end

        allow($stdin).to receive(:gets).and_return('1', '2', '3', '4', '5', '6', '7', '8', '9')

        @game.play
        output = $stdout.string.split("\n")

        expect(output).to include('Game over! Player 1 wins!')
      end
    end

    describe 'when Player 2 wins' do
      it 'loops until winning combo is recorded and then declares Player 2 as the winner' do
        @game = GameBuilder.build do |builder|
          builder.board(@board_size)
          builder.players(@players)
        end

        allow($stdin).to receive(:gets).and_return('1', '5', '4', '2', '3', '8')

        @game.play
        output = $stdout.string.split("\n")

        expect(output).to include('Game over! Player 2 wins!')
      end
    end

    describe 'when the game is a draw' do
      it 'loops until board is full and then declares a draw' do
        @game = GameBuilder.build do |builder|
          builder.board(@board_size)
          builder.players(@players)
        end

        allow($stdin).to receive(:gets).and_return('5', '2', '8', '7', '4', '6', '3', '1', '9')

        @game.play
        output = $stdout.string.split("\n")

        expect(output).to include("Game over! It's a draw!")
      end
    end
  end

  context 'when invalid input is entered' do
    before do
      @game = GameBuilder.build do |builder|
        builder.board(@board_size)
        builder.players(@players)
      end
    end

    describe 'when an invalid character is entered' do
      {
        n: 'a letter',
        '0': 'zero',
        '26': 'an out of range number',
        ' ': 'an empty space',
        nil: 'nil'
      }.each do |invalid_input, type|
        it "re-prompts player for input when #{type} is selected" do
          allow($stdin).to receive(:gets).and_return(invalid_input.to_s, '1', '2', '3', '4', '5', '6', '7', '8', '9')

          @game.play
          output = $stdout.string.split("\n")

          expect(output).to include('Invalid character! Please select an integer from 1-9:')
        end
      end
    end

    describe 'when an occupied space is selected' do
      it 're-prompts player for input until free space is selected' do
        allow($stdin).to receive(:gets).and_return('1', '1', '2', '3', '4', '5', '6', '7', '8', '9')

        @game.play
        output = $stdout.string.split("\n")

        expect(output).to include('Invalid move! Please select a free space:')
      end
    end
  end
end
