# frozen_string_literal: true

class EasyAiPlayer
  attr_reader :name, :marker

  def initialize(board, player_marker)
    @name = 'Computer'
    @marker = 'X'
    @player_marker = player_marker
    @board = board
  end

  def select
    first_free = @board.spaces.find_index { |val| val.is_a? Integer }
    (first_free + 1).to_s
  end

  def turn_message
    "#{@name} is processing its move..."
  end
end
