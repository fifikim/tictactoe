# frozen_string_literal: true

require 'input_validator'
require 'board'

describe InputValidator do
  describe '.invalid_selection?' do
    before do
      @board = Board.new
    end

    context 'when checking selected spaces for a 3x3 board' do
      {
        n: 'not a number',
        '0': 'zero',
        '10': 'out of range',
        ' ': 'an empty space',
        nil: 'nil'
      }.each do |invalid_input, type|
        it "returns true when input is #{type}" do
          validate = InputValidator.invalid_selection?(9, invalid_input.to_s)
          expect(validate).to be true
        end
      end

      it 'returns false if the selection is valid' do
        validate = InputValidator.invalid_selection?(9, '8')
        expect(validate).to be false
      end
    end

    context 'when checking selected spaces for a 4x4 board' do
      {
        n: 'not a number',
        '0': 'zero',
        '17': 'out of range',
        ' ': 'an empty space',
        nil: 'nil'
      }.each do |invalid_input, type|
        it "returns true when input is #{type}" do
          validate = InputValidator.invalid_selection?(15, invalid_input.to_s)
          expect(validate).to be true
        end
      end

      it 'returns false if the selection is valid' do
        validate = InputValidator.invalid_selection?(15, '14')
        expect(validate).to be false
      end
    end

    context 'when checking selected spaces for a 5x5 board' do
      {
        n: 'not a number',
        '0': 'zero',
        '26': 'out of range',
        ' ': 'an empty space',
        nil: 'nil'
      }.each do |invalid_input, type|
        it "returns true when input is #{type}" do
          validate = InputValidator.invalid_selection?(25, invalid_input.to_s)
          expect(validate).to be true
        end
      end

      it 'returns false if the selection is valid' do
        validate = InputValidator.invalid_selection?(25, '22')
        expect(validate).to be false
      end
    end
  end
end
