# frozen_string_literal: true

require 'game_builder'
require 'main'
require 'stringio'

describe GameBuilder do
  before do
    @main = Main.new
    $stdout = StringIO.new
  end

  describe '.configure_game' do
    {
      'Player vs. Player (normal order)': ['1', '1', 'Player 1', 'Player 2'],
      'Player vs. Player (reverse order)': ['1', '2', 'Player 2', 'Player 1'],
      'Computer vs. Player (normal order)': ['2', '1', 'Computer', 'Player 1'],
      'Computer vs. Player (reverse order)': ['2', '2', 'Player 1', 'Computer']
    }.each do |type, options|
      context "when #{type} is selected" do
        before do
          allow($stdin).to receive(:gets).and_return(options[0], options[1])
          @game = @main.configure_game
        end

        it "initializes current_player as #{options[2]}" do
          expect(@game.current_player.name).to eq(options[2])
        end

        it "initializes current_player with a marker of 'X'" do
          expect(@game.current_player.marker).to eq('X')
        end

        it "initializes next_player as #{options[3]}" do
          expect(@game.next_player.name).to eq(options[3])
        end

        it "initializes next_player with a marker of 'O'" do
          expect(@game.next_player.marker).to eq('O')
        end
      end
    end

    context 'when invalid selection is made for player type' do
      {
        n: 'an invalid character',
        '0': 'zero',
        '3': 'an out-of-range number',
        '10': 'a double-digit integer',
        ' ': 'an empty space',
        nil: 'nil'
      }.each do |invalid_input, type|
        it "displays an error message if #{type} is entered" do
          allow($stdin).to receive(:gets).and_return(invalid_input.to_s, '1', '1')

          @game = @main.configure_game

          output = $stdout.string.split("\n")
          expect(output).to include('Invalid selection! Please choose from the numbers listed above.')
        end
      end
    end

    context 'when invalid selection is made for player order' do
      {
        n: 'an invalid character',
        '0': 'zero',
        '3': 'an out-of-range number',
        '10': 'a double-digit integer',
        ' ': 'an empty space',
        nil: 'nil'
      }.each do |invalid_input, type|
        it "displays an error message if #{type} is entered" do
          allow($stdin).to receive(:gets).and_return('1', invalid_input.to_s, '1')

          @game = @main.configure_game

          output = $stdout.string.split("\n")
          expect(output).to include('Invalid selection! Please choose from the numbers listed above.')
        end
      end
    end
  end
end
