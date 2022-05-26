# frozen_string_literal: true

require 'order_selector'
require 'console'
require 'stringio'

describe OrderSelector do
  describe '.select' do
    it 'takes in a user input' do
      allow($stdin).to receive(:gets).and_return('1')
      selection = OrderSelector.select

      expect(selection).to eq('1')
    end
  end

  describe '.validate' do
    it 'returns true when a valid selection is entered' do
      result = OrderSelector.validate('1')

      expect(result).to be true
    end

    {
      n: 'not a number',
      '0': 'zero',
      '10': 'a double-digit integer',
      ' ': 'an empty space',
      nil: 'nil'
    }.each do |invalid_input, type|
      it "returns false when input is #{type}" do
        validate = OrderSelector.validate(invalid_input.to_s)
        expect(validate).to be false
      end
    end
  end

  describe '.record' do
    context "when '1' is selected" do
      it 'returns an array with the same order as input' do
        selection = '1'
        unordered_players = ['Computer', 'Player 1']
        ordered_players = OrderSelector.record(selection, unordered_players)
        expect(ordered_players).to eq(['Computer', 'Player 1'])
      end
    end

    context "when '2' is selected" do
      it 'returns an array with input order reversed' do
        selection = '2'
        unordered_players = ['Computer', 'Player 1']
        ordered_players = OrderSelector.record(selection, unordered_players)
        expect(ordered_players).to eq(['Player 1', 'Computer'])
      end
    end
  end
end
