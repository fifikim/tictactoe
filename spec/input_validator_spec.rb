# frozen_string_literal: true

require 'input_validator'

describe InputValidator do
  let(:game_double) { Class.new { extend InputValidator } }
  describe '.invalid_selection?' do
    context 'when an invalid character is selected' do
      it 'returns true when input is not a number' do
        validate = game_double.invalid_selection?('n')
        expect(validate).to be true
      end

      it 'returns true when input is 0' do
        validate = game_double.invalid_selection?('0')
        expect(validate).to be true
      end

      it 'returns true when input is a double-digit integer' do
        validate = game_double.invalid_selection?('10')
        expect(validate).to be true
      end

      it 'returns true when input is an empty space' do
        validate = game_double.invalid_selection?(' ')
        expect(validate).to be true
      end

      it 'returns true when nothing is input' do
        validate = game_double.invalid_selection?(nil)
        expect(validate).to be true
      end
    end

    context 'when a valid integer is selected' do
      it 'returns false' do
        validate = game_double.invalid_selection?('8')
        expect(validate).to be false
      end
    end
  end
end
