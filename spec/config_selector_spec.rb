# frozen_string_literal: true

require 'main_console'
require 'config_selector'
require 'stringio'
require 'board_mocker'

describe ConfigSelector do
  describe '.select_options' do
    before do
      @console = MainConsole.new
      $stdout = StringIO.new
      allow($stdin).to receive(:gets).and_return('2', '1', '2')
      selector = ConfigSelector.new(@console)
      @game = selector.select_options
      @output = $stdout.string.split("\n")
    end

    it 'prompts the user to select opponent' do
      expect(@output).to include('Who would you like to play against?')
    end

    it 'prompts the user to select the order of players' do
      expect(@output).to include('Who should take the first turn?')
    end

    it 'displays the correct choices for the order menu' do
      expect(@output).to include('1 - Player 1 (Computer)', '2 - Player 2')
    end

    it 'prompts the user to select the size of the board' do
      expect(@output).to include('What size board would you like?')
    end

    it 'builds a game with the selected players' do
      players = [@game.current_player.name, @game.next_player.name]
      expect(players).to eq(['Player 1 (Computer)', 'Player 2'])
    end

    it 'assigns the first turn to the correct player' do
      expect(@game.current_player.name).to eq('Player 1 (Computer)')
    end

    it 'builds the correct size board' do
      expect(@game.board.spaces).to eq((1..16).to_a)
    end

    it 'configures the WinFinder with the correct board' do
      board = BoardMocker.fill(16, { X: [4, 7, 10, 13] })
      game_won = @game.win_finder.game_won?(board, 'X')

      expect(game_won).to be true
    end

    it 'configures the InputValidator to take in the correct board size' do
      invalid_input = InputValidator.invalid_selection?(@game.board_size, 17)

      expect(invalid_input).to be true
    end
  end

  context 'when user makes an invalid selection' do
    before do
      @console = MainConsole.new
      $stdout = StringIO.new
    end

    {
      n: 'not a number',
      '0': 'zero',
      '10': 'a double-digit integer',
      ' ': 'an empty space',
      nil: 'nil'
    }.each do |invalid_input, type|
      it "displays an error message when selection is #{type}" do
        allow($stdin).to receive(:gets).and_return(invalid_input.to_s, '2', '$', '%', '1', '2')
        ConfigSelector.new(@console).select_options

        output = $stdout.string.split("\n")
        expect(output).to include('Invalid selection! Please choose from the numbers listed above.')
      end
    end
  end
end
