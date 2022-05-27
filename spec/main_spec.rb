# frozen_string_literal: true

require 'main'
require 'config_selector'
require 'stringio'

describe Main do
  describe '.run' do
    before do
      @main = Main.new
      $stdout = StringIO.new

      allow($stdin).to receive(:gets).and_return('1', '1', '1', '2', '3', '4', '5', '6', '7')

      @main.run
      @output = $stdout.string.split("\n")
    end

    it 'prints the select_players menu' do
      expect(@output).to include('Who would you like to play against?')
    end

    it 'prints Tic Tac Toe instructions' do
      expect(@output).to include('TIC TAC TOE')
    end

    it "initializes as player 1's turn by default" do
      over_message = @output.find { |string| string.include?('Game over!') }
      expect(over_message).to include('Game over!')
    end

    it 'displays a goodbye message after the game ends' do
      expect(@output).to include('Thanks for playing! Goodbye.')
    end
  end
end
