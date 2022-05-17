# frozen_string_literal: true

require 'move'
require 'stringio'

describe Move do
  it 'creates a new object' do
    move = Move.new(1, Board.new((1..9).to_a), Console.new)
    expect(move).to be_an_instance_of(Move)
  end

  describe '.select_space' do
    it 'sends console.output' do
      # TODO
      # console = double
      # board = double((1..9).to_a)

      # move = Move.new(1, board, console)
      # expect(console).to receive(:output).with("\nPlayer 1's move:")

      # allow($stdin).to receive(:gets).and_return('1')
      # $stdin = StringIO.new

      # move.select_space
    end

    it 'takes in player\'s input' do
      # TODO
    end

    it 'sends validate_selection' do
      # TODO
    end
  end
end
