# frozen_string_literal: true

require 'player_selector'
require 'console'
require 'input'
require 'stringio'

describe PlayerSelector do
  describe '.select' do
    it 'takes in a user input' do
      allow($stdin).to receive(:gets).and_return('1')
      selection = Input.get

      expect(selection).to eq('1')
    end
  end

  describe '.validate' do
    it 'returns true when a valid selection is entered' do
      result = PlayerSelector.validate('1')

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
        validate = PlayerSelector.validate(invalid_input.to_s)
        expect(validate).to be false
      end
    end
  end

  describe '.record' do
    context "when '1' is selected" do
      it 'returns an array with 2 HumanPlayers' do
        selection = '1'
        players = PlayerSelector.record(selection)

        expect([players[0].class, players[1].class]).to eq([HumanPlayer, HumanPlayer])
      end
    end

    context "when '2' is selected" do
      it 'returns an array with an EasyAiPlayer and a HumanPlayer' do
        selection = '2'
        players = PlayerSelector.record(selection)

        expect([players[0].class, players[1].class]).to eq([EasyAiPlayer, HumanPlayer])
      end
    end
  end
end
