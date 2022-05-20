# frozen_string_literal: true

require 'easy_ai'
require 'board'

describe EasyAiPlayer do
  before do
    @board = Board.new
    @ai_player = EasyAiPlayer.new(@board, 'O')
  end

  it 'returns the correct value for .name' do
    expect(@ai_player.name).to eq('Computer')
  end

  it 'returns the correct value for .mark' do
    expect(@ai_player.mark).to eq('X')
  end

  context 'when the board is empty' do
    it 'selects space #1' do
      @board = Board.new
      @ai_player = EasyAiPlayer.new(@board, 'O')

      first_free = @ai_player.select
      expect(first_free).to eq('1')
    end
  end

  context 'when space #1 has already been selected' do
    it 'selects space #2' do
      @board = Board.new(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      @ai_player = EasyAiPlayer.new(@board, 'O')

      first_free = @ai_player.select
      expect(first_free).to eq('2')
    end
  end

  context 'when space #2 has already been selected' do
    it 'selects space #1' do
      @board = Board.new(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      @ai_player = EasyAiPlayer.new(@board, 'O')

      first_free = @ai_player.select
      expect(first_free).to eq('2')
    end
  end

  context 'when multiple spaces have been selected' do
    it 'selects the first available space' do
      @board = Board.new(['X', 'O', 'X', 4, 'O', 6, 'X', 8, 9])
      @ai_player = EasyAiPlayer.new(@board, 'O')

      first_free = @ai_player.select
      expect(first_free).to eq('4')
    end
  end
end
