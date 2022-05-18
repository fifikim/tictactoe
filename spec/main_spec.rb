# frozen_string_literal: true

require 'main'
require 'stringio'

describe Main do
  describe '.run' do
    before do
      @main = Main.new
      $stdout = StringIO.new

      allow($stdin).to receive(:gets).and_return('1', '2', '3', '4', '5', '6', '7')

      @main.run
      @output = $stdout.string.split("\n")
    end

    it 'begins the program by printing Tic Tac Toe instructions' do
      expect(@output.first).to eq('TIC TAC TOE')
    end

    it 'executes Game.play until the game is over' do
      expect(@output[-2]).to eq('Game over! Player 1 wins!')
    end

    it 'displays a goodbye message after the game ends' do
      expect(@output.last).to eq('Thanks for playing! Goodbye.')
    end
  end
end
