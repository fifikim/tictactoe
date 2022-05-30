# frozen_string_literal: true

require 'board'
require 'game_console'
require 'human_player'
require 'stringio'

describe GameConsole do
  before do
    @console = GameConsole.new(9)
    $stdout = StringIO.new
  end

  it 'should take in a message and print it to the console' do
    @console.output('A console instance printed this test message')
    output = $stdout.string.split("\n")

    expect(output).to include('A console instance printed this test message')
  end

  context 'when the board is 3x3' do
    before do
      @console = GameConsole.new(9)
      @board = Board.new
    end

    describe '.instructions' do
      it 'should display the instructions with correct input range of 1-9' do
        @console.instructions
        @output = $stdout.string.split("\n")
        expect(@output).to include('Enter the number (1-9) of the space on the board where you want to move.')
      end
    end

    describe '.board' do
      it 'should print the current state of the board in a 3x3 template' do
        @console.board(@board)
        @output = $stdout.string.split("\n")
        expect(@output).to include('  1 |  2 |  3 ')
      end
    end
  end

  context 'when the board is 4x4' do
    before do
      @console = GameConsole.new(16)
      @board = Board.new((1..16).to_a)
    end

    describe '.instructions' do
      it 'should display the instructions with correct input range of 1-16' do
        @console.instructions
        @output = $stdout.string.split("\n")
        expect(@output).to include('Enter the number (1-16) of the space on the board where you want to move.')
      end
    end

    describe '.board' do
      it 'should print the current state of the board with the correct template' do
        @console.board(@board)
        @output = $stdout.string.split("\n")

        expect(@output).to include('  1 |  2 |  3 |  4 ')
      end
    end
  end

  context 'when the board is 5x5' do
    before do
      @console = GameConsole.new(25)
      @board = Board.new((1..25).to_a)
    end

    describe '.instructions' do
      it 'should display the instructions with correct input range of 1-25' do
        @console.instructions
        @output = $stdout.string.split("\n")

        expect(@output).to include('Enter the number (1-25) of the space on the board where you want to move.')
      end
    end

    describe '.board' do
      it 'should print the current state of the board with the correct template' do
        @console.board(@board)
        @output = $stdout.string.split("\n")

        expect(@output).to include('  1 |  2 |  3 |  4 |  5 ')
      end
    end
  end
end
