# frozen_string_literal: true

require 'marker_selector'
require 'input'
require 'stringio'
require 'human_player'

describe MarkerSelector do
  describe '.wrong_length' do
    it 'returns false when a single character is entered' do
      wrong_length = MarkerSelector.wrong_length('$')
      expect(wrong_length).to be false
    end

    {
      'XO' => 'multiple characters',
      ' ' => 'an empty space',
      '' => 'nothing'
    }.each do |invalid_input, type|
      it "returns true when input is #{type}" do
        allow($stdin).to receive(:gets).and_return(invalid_input)

        selection = Input.choose
        validate = MarkerSelector.wrong_length(selection)

        expect(validate).to be true
      end
    end
  end

  describe '.number' do
    it 'returns false when the marker is not a number' do
      allow($stdin).to receive(:gets).and_return('%')

      selection = Input.choose
      number = MarkerSelector.number(selection)

      expect(number).to be false
    end

    it 'returns true when the marker is a number' do
      allow($stdin).to receive(:gets).and_return('4')

      selection = Input.choose
      number = MarkerSelector.number(selection)

      expect(number).to be true
    end
  end

  describe '.duplicate' do
    it 'returns false when the first marker is selected' do
      markers = []
      allow($stdin).to receive(:gets).and_return('$')

      selection = Input.choose
      duplicated = MarkerSelector.duplicate(markers, selection)

      expect(duplicated).to be false
    end

    it 'returns false when the second marker is different from the first' do
      markers = ['$']
      allow($stdin).to receive(:gets).and_return('%')

      selection = Input.choose
      duplicated = MarkerSelector.duplicate(markers, selection)

      expect(duplicated).to be false
    end

    it 'returns true when the second marker is different from the first' do
      markers = ['$']
      allow($stdin).to receive(:gets).and_return('$')

      selection = Input.choose
      duplicated = MarkerSelector.duplicate(markers, selection)

      expect(duplicated).to be true
    end
  end

  describe '.record' do
    before do
      players = [HumanPlayer.new('Player 1'), HumanPlayer.new('Player 2')]
      markers = ['$', '%']
      @players_with_markers = MarkerSelector.record(players, markers)
    end

    it 'assigns the first marker to the first player passed in' do
      expect(@players_with_markers[0].marker).to eq('$')
    end

    it 'assigns the second marker to the second player passed in' do
      expect(@players_with_markers[1].marker).to eq('%')
    end
  end
end
