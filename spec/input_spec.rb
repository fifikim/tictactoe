# frozen_string_literal: true

require 'input'

describe Input do
  describe '.choose_space' do
    it 'returns input received from $stdin as a string' do
      allow($stdin).to receive(:gets).and_return('8')
      input = Input.choose_space

      expect(input).to eq('8')
    end
  end

  describe '.choose_option' do
    it 'returns input received from $stdin as an integer minus 1' do
      allow($stdin).to receive(:gets).and_return('8')
      input = Input.choose_option

      expect(input).to eq(7)
    end
  end
end
