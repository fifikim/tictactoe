# frozen_string_literal: true

require 'move'

describe Move do
  it 'creates a new object' do
    move = Move.new(1, Board.new((1..9).to_a), Console.new)
    expect(move).to be_an_instance_of(Move)
  end

  describe '.select_space' do
    it 'sends console.output' do
      # TODO
    end

    it 'takes in player\'s input' do
      # TODO
    end

    it 'sends validate_selection' do
      # TODO
    end
  end
end
