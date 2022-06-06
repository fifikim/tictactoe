# frozen_string_literal: true

require 'main'
require 'translator'
require 'stringio'

describe Main do
  describe '.run' do
    before do
      Translator.new.switch_locale(:en)
      @main = Main.new
      $stdout = StringIO.new

      allow($stdin).to receive(:gets).and_return('1', '1', '$', '%', '1', '1', '1', '2', '3', '4', '5', '6', '7', '8',
                                                 '9')

      @main.run
      @output = $stdout.string.split("\n")
    end

    it 'prints Tic Tac Toe greeting' do
      expect(@output).to include('Welcome to TIC TAC TOE')
    end

    it 'prints the Language menu' do
      expect(@output).to include('Please select your language:')
    end

    it 'prints the Players menu' do
      expect(@output).to include('Who would you like to play against?')
    end

    it 'prints the Order menu' do
      expect(@output).to include('Who should take the first turn?')
    end

    it 'prompts the user to select opponent' do
      expect(@output).to include('Who would you like to play against?')
    end

    it 'prompts the user to select a marker for the first player' do
      expect(@output).to include('Select a marker for Player 1:')
    end

    it 'prompts the user to select a marker for the second player' do
      expect(@output).to include('Select a marker for Player 2:')
    end

    it 'prompts the user to select the order of players' do
      expect(@output).to include('Who should take the first turn?')
    end

    it 'displays the correct choices for the order menu' do
      expect(@output).to include('1 - Player 1', '2 - Player 2')
    end

    it 'prompts the user to select the size of the board' do
      expect(@output).to include('What size board would you like?')
    end

    it "displays 'Starting new game' message after user finishes selecting options" do
      expect(@output).to include('Starting new game...')
    end

    it 'loops the game until the game is finished' do
      over_message = @output.find { |string| string.include?('Game over!') }
      expect(over_message).to include('Game over!')
    end

    it 'displays a goodbye message after the game ends' do
      expect(@output).to include('Thanks for playing! Goodbye.')
    end
  end
end
