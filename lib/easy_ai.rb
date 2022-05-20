# frozen_string_literal: true

class EasyAiPlayer
  attr_reader :name, :mark

  def initialize(board, player_mark)
    @name = 'Computer'
    @mark = 'X'
    @player_mark = player_mark
    @board = board
  end

  def select
    first_free = @board.spaces.find_index { | val | val.is_a? Integer }
    (first_free + 1).to_s
  end

  def turn_message
    "#{@name} is processing its move..."
  end
end
