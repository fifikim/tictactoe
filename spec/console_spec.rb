# frozen_string_literal: true

require 'board'
require 'console'

describe Console do
  before do
    @console = Console.new
  end

  it 'should take in a message and print it to the console' do
    message = 'A console instance printed this test message'
    expect do
      @console.output(message)
    end.to output("A console instance printed this test message\n").to_stdout
  end

  describe '.instructions' do
    it 'should print instructions to the console' do
      expect do
        @console.instructions
      end.to output("TIC TAC TOE\n\nInstructions:\nEnter the number (1-9) of the space on the board where you want to move.\nPlayer 1 moves first and marks their spaces with an \"X\". Player 2 marks with an \"O\".\nTo win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.\nIf there are no free spaces and no player has won, the game will end in a draw.\n\nStarting new game...\n\n").to_stdout
    end
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
