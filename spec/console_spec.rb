# frozen_string_literal: true

require 'board'
require 'console'
require 'player'
require 'stringio'

describe Console do
  before do
    @console = Console.new
    $stdout = StringIO.new
  end

  it 'should take in a message and print it to the console' do
    @console.output('A console instance printed this test message')
    output = $stdout.string.split("\n")

    expect(output).to include('A console instance printed this test message')
  end

  describe '.board' do
    it 'should print the current state of the board' do
      expect do
        board = Board.new((1..9).to_a)
        @console.board(board)
      end.to output("\n 1 | 2 | 3\n---|---|---\n 4 | 5 | 6\n---|---|---\n 7 | 8 | 9\n\n").to_stdout
    end
  end

  describe '.instructions' do
    it 'should print instructions to the console' do
      @console.instructions
      output = $stdout.string.split("\n")
      expect(output).to include('Instructions:')
    end
  end

  describe '.player_menu' do
    it 'should display the player menu' do
      @console.player_menu
      output = $stdout.string.split("\n")

      expect(output).to include('Who would you like to play against?')
    end
  end
end
