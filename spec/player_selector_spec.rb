# frozen_string_literal: true

require 'player_selector'
require 'input'
require 'stringio'

describe PlayerSelector do
  describe '.select' do
    it 'takes in a user selection and converts it to an index' do
      allow($stdin).to receive(:gets).and_return('1')
      selection = Input.choose_option

      expect(selection).to eq(0)
    end
  end

  describe '.validate' do
    it 'returns true when a valid selection is entered' do
      selection_valid = PlayerSelector.validate(1)

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
        validate = PlayerSelector.validate(invalid_input)
        expect(validate).to be false
      end
    end
  end

  describe '.record' do
    context "when '1' is selected" do
      it 'returns an array with 2 HumanPlayers' do
        selection = 0
        players = PlayerSelector.record(selection)

        expect([players[0].class, players[1].class]).to eq([HumanPlayer, HumanPlayer])
      end
    end

    context "when '2' is selected" do
      it 'returns an array with an EasyAiPlayer and a HumanPlayer' do
        selection = 1
        players = PlayerSelector.record(selection)

        expect([players[0].class, players[1].class]).to eq([EasyAiPlayer, HumanPlayer])
      end
    end
  end
end
