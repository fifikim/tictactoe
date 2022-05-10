# frozen_string_literal: true

require 'rspec'
require 'tictactoe'

describe 'Tic Tac Toe game' do
  it 'initializes a new game' do
    tictactoe = TicTacToe.new
    expect(tictactoe).to be_instance_of(TicTacToe)
  end
end
