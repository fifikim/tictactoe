# frozen_string_literal: true

require 'main_console'
require 'human_player'
require 'stringio'

describe MainConsole do
  before do
    @console = MainConsole.new
    $stdout = StringIO.new
  end

  it 'should take in a message and print it to the console' do
    @console.output('A console instance printed this test message')
    output = $stdout.string.split("\n")

    expect(output).to include('A console instance printed this test message')
  end

  describe '.player_menu' do
    it 'should display the player menu' do
      @console.player_menu
      output = $stdout.string.split("\n")
      expect(output).to include('Who would you like to play against?')
    end
  end

  describe '.order_menu' do
    @console = MainConsole.new
    $stdout = StringIO.new
    unordered_players = [HumanPlayer.new('Player 1', 'X'), HumanPlayer.new('Player 2', 'O')]
    @console.order_menu(unordered_players)
    output = $stdout.string.split("\n")

    it 'should display the player order menu' do
      expect(output).to include('Who should take the first turn?')
    end

    it "should correctly display the first player's name" do
      expect(output).to include('1 - Player 1')
    end

    it "should correctly display the second player's name" do
      expect(output).to include('2 - Player 2')
    end
  end

  describe '.board_menu' do
    it 'should display the board menu' do
      @console.board_menu
      output = $stdout.string.split("\n")
      expect(output).to include('What size board would you like?')
    end
  end

  describe '.marker_prompt' do
    it 'should prompt the user to select a marker for a given player' do
      player = HumanPlayer.new('Test Player 1')
      @console.marker_prompt(player)
      output = $stdout.string.split("\n")

      expect(output).to include('Select a marker for Test Player 1:')
    end
  end
end
