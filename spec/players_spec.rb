# frozen_string_literal: true

require 'players'

describe Players do
  it "initializes as player 1's turn by default" do
    players = Players.new
    expect(players.current_player).to eq(1)
  end

  it 'switches to player 2 after player 1' do
    players = Players.new(1)
    players.switch
    expect(players.current_player).to eq(2)
  end

  it 'switches to player 1 after player 2' do
    players = Players.new(2)
    players.switch
    expect(players.current_player).to eq(1)
  end
end
