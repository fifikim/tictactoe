# frozen_string_literal: true

require 'order_selector'
require 'console'
require 'human_player'
require 'players'
require 'input'
require 'stringio'

describe OrderSelector do
  describe '.select' do
    it 'takes in a user input' do
      allow($stdin).to receive(:gets).and_return('1')
      selection = Input.get

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
    it 'returns a Players object' do
      unordered_players = [HumanPlayer.new('Player 1', 'X'), HumanPlayer.new('Player 2', 'O')]
      players = OrderSelector.record('1', unordered_players)

      expect(players).to be_an_instance_of(Players)
    end

    context "when '1' is selected" do
      it 'assigns the first turn to Player 1' do
        selection = '1'
        unordered_players = [HumanPlayer.new('Player 1', 'X'), HumanPlayer.new('Player 2', 'O')]
        players = OrderSelector.record(selection, unordered_players)
        first_player = players.initial_order[0].name

        expect(first_player).to eq('Player 1')
      end
    end

    context "when '2' is selected" do
      it 'assigns the first turn to Player 2' do
        selection = '2'
        unordered_players = [HumanPlayer.new('Player 1', 'X'), HumanPlayer.new('Player 2', 'O')]
        players = OrderSelector.record(selection, unordered_players)
        first_player = players.initial_order[0].name

        expect(first_player).to eq('Player 2')
      end
    end
  end
end
