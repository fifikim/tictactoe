# frozen_string_literal: true

class EasyAiPlayer
  attr_reader :name, :marker

  def initialize(board, marker)
    @name = 'Computer'
    @marker = marker
    @board = board
  end

  def select(markers)
    @board.first_free(markers)
  end

  def turn_message
    "#{@name} is processing its move..."
  end
end
