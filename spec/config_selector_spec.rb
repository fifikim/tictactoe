# frozen_string_literal: true

require 'main_console'
require 'config_selector'
require 'stringio'

describe ConfigSelector do
  describe '.select_options' do
    before do
      @console = MainConsole.new
      $stdout = StringIO.new
    end

    context 'when Player Menu choice 1 is selected' do
      it 'creates a Game with 2 HumanPlayers' do
        allow($stdin).to receive(:gets).and_return('1')
        selector = ConfigSelector.new(@console)
        game = selector.select_options
        player_types = [game.current_player.class, game.next_player.class]

        expect(player_types).to eq([HumanPlayer, HumanPlayer])
      end
    end

    context 'when Player Menu choice 2 is selected' do
      it 'creates a Game with 1 EasyAiPlayer and 1 HumanPlayer' do
        allow($stdin).to receive(:gets).and_return('2', '1')
        game = ConfigSelector.new(@console).select_options
        player_types = [game.current_player.class, game.next_player.class]

        expect(player_types).to eq([EasyAiPlayer, HumanPlayer])
      end
    end

    context 'when Order Menu choice 1 is selected' do
      it 'assigns the first turn to Player 1' do
        allow($stdin).to receive(:gets).and_return('1', '1')
        game = ConfigSelector.new(@console).select_options

        expect(game.current_player.name).to eq('Player 1')
      end
    end

    context 'when Order Menu choice 2 is selected' do
      it 'assigns the first turn to Player 2' do
        allow($stdin).to receive(:gets).and_return('1', '2')
        game = ConfigSelector.new(@console).select_options

        expect(game.current_player.name).to eq('Player 2')
      end
    end

    context 'when Board Menu choice 1 is selected' do
      it 'creates a 3x3 board' do
        allow($stdin).to receive(:gets).and_return('1', '1', '1')
        game = ConfigSelector.new(@console).select_options

        expect(game.board.spaces).to eq((1..9).to_a)
      end
    end

    context 'when Board Menu choice 2 is selected' do
      it 'creates a 4x4 board' do
        allow($stdin).to receive(:gets).and_return('1', '1', '2')
        game = ConfigSelector.new(@console).select_options

        expect(game.board.spaces).to eq((1..16).to_a)
      end
    end

    context 'when Board Menu choice 3 is selected' do
      it 'creates a 5x5 board' do
        allow($stdin).to receive(:gets).and_return('1', '1', '3')
        game = ConfigSelector.new(@console).select_options

        expect(game.board.spaces).to eq((1..25).to_a)
      end
    end

    context 'when user makes an invalid selection' do
      {
        n: 'not a number',
        '0': 'zero',
        '10': 'a double-digit integer',
        ' ': 'an empty space',
        nil: 'nil'
      }.each do |invalid_input, type|
        it "displays an error message when selection is #{type}" do
          allow($stdin).to receive(:gets).and_return(invalid_input.to_s, '2')
          ConfigSelector.new(@console).select_options

          output = $stdout.string.split("\n")
          expect(output).to include('Invalid selection! Please choose from the numbers listed above.')
        end
      end
    end
  end
end
