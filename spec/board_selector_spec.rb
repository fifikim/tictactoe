# frozen_string_literal: true

require 'board_selector'
require 'input'

describe BoardSelector do
  describe '.validate' do
    it 'returns true when a valid selection is entered' do
      selection_valid = BoardSelector.validate(0)

      expect(selection_valid).to be true
    end

    {
      'n' => 'not a number',
      -1 => 'a negative number',
      3 => 'an out of range number',
      ' ' => 'an empty space',
      nil => 'nil'
    }.each do |invalid_input, type|
      it "returns false when input is #{type}" do
        validate = BoardSelector.validate(invalid_input)
        expect(validate).to be false
      end
    end
  end

  describe '.record' do
    context "when '1' (index 0) is selected" do
      it 'returns 9 representing the size of a 3x3 board' do
        selection = 0
        board_size = BoardSelector.record(selection)

        expect(board_size).to eq(9)
      end
    end

    context "when '2' (index 1) is selected" do
      it 'returns 16 representing the size of a 4x4 board' do
        selection = 1
        board_size = BoardSelector.record(selection)

        expect(board_size).to eq(16)
      end
    end

    context "when '3' (index 2) is selected" do
      it 'returns 25 representing the size of a 5x5 board' do
        selection = 2
        board_size = BoardSelector.record(selection)

        expect(board_size).to eq(25)
      end
    end
  end
end
