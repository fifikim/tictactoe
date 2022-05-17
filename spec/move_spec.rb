# frozen_string_literal: true

require 'move'

describe Move do
  it 'creates a new object' do
    move = Move.new(1, Board.new((1..9).to_a), Console.new)
    expect(move).to be_an_instance_of(Move)
  end

  describe '.take' do
    it 'sends display_board' do
      # TODO: stub this
    end

    it 'sends select_space' do
    end
  end
end
