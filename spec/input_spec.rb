# frozen_string_literal: true

require 'input'

describe Input do
  describe '.get' do
    it 'returns input received from $stdin' do
      allow($stdin).to receive(:gets).and_return('8')
      input = Input.get

      expect(input).to eq('8')
    end
  end
end
