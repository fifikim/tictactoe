# frozen_string_literal: true

require 'board_selector'
require 'input'

describe BoardSelector do
  describe '.select' do
    it 'takes in a user input' do
      allow($stdin).to receive(:gets).and_return('1')
      selection = Input.get

      expect(selection).to eq('1')
    end
  end

  describe '.validate' do
    it 'returns true when a valid selection is entered' do
      result = BoardSelector.validate('1')

      expect(result).to be true
    end

    {
      n: 'not a number',
      '0': 'zero',
      '4': 'a double-digit integer',
      ' ': 'an empty space',
      nil: 'nil'
    }.each do |invalid_input, type|
      it "returns false when input is #{type}" do
        validate = BoardSelector.validate(invalid_input.to_s)
        expect(validate).to be false
      end
    end
  end

  describe '.record' do
    context "when '1' is selected" do
      it 'returns 9 representing the size of a 3x3 board' do
        selection = '1'
        board_size = BoardSelector.record(selection)

        expect(board_size).to eq(9)
      end
    end

    context "when '2' is selected" do
      it 'returns 16 representing the size of a 4x4 board' do
        selection = '2'
        board_size = BoardSelector.record(selection)

        expect(board_size).to eq(16)
      end
    end

    context "when '3' is selected" do
      it 'returns 25 representing the size of a 5x5 board' do
        selection = '3'
        board_size = BoardSelector.record(selection)

        expect(board_size).to eq(25)
      end
    end
  end
end
