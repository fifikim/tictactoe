# frozen_string_literal: true

require 'input_validator'

describe InputValidator do
  let(:game_double) { Class.new { extend InputValidator } }

  context 'when selection is an invalid character' do
    it 'returns true' do
      validate = game_double.invalid_selection?('n')
      expect(validate).to be true
    end
  end

  context 'when selection is a valid character' do
    it 'returns false' do
      validate = game_double.invalid_selection?('8')
      expect(validate).to be false
    end
  end
end
