# frozen_string_literal: true

require 'input_validator'

describe InputValidator do
  let(:game_double) { Class.new { extend InputValidator } }
  describe '.invalid_selection?' do
    context 'when an invalid character is selected' do
      {
        n: 'not a number',
        '0': 'zero',
        '10': 'a double-digit integer',
        ' ': 'an empty space',
        nil: 'nil'
      }.each do |invalid_input, type|
        it "returns true when input is #{type}" do
          validate = game_double.invalid_selection?(invalid_input.to_s)
          expect(validate).to be true
        end
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
