# frozen_string_literal: true

require 'board'
require 'console'
require 'stringio'

describe Console do
  before do
    @console = Console.new
    $stdout = StringIO.new
  end

  it 'should take in a message and print it to the console' do
    @console.output('A console instance printed this test message')
    output = $stdout.string.split("\n")

    expect(output).to include("A console instance printed this test message")
  end

  describe '.instructions' do
    it 'should print instructions to the console' do
      @console.instructions
      output = $stdout.string.split("\n")
      expect(output).to include('Instructions:')
    end
  end

  it 'should display the game menu' do
    @console.menu
    output = $stdout.string.split("\n")

    expect(output).to include("What type of game would you like to play?")
  end

  describe '.board' do
    it 'should print the current state of the board' do
      expect do
        board = Board.new((1..9).to_a)
        @console.board(board)
      end.to output("\n 1 | 2 | 3\n---|---|---\n 4 | 5 | 6\n---|---|---\n 7 | 8 | 9\n\n").to_stdout
    end
  end
end


