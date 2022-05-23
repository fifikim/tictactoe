# frozen_string_literal: true

class EasyAiPlayer
  attr_reader :name, :marker

  def initialize(board)
    @name = 'Computer'
    @marker = 'X'
    @board = board
  end

  def select
    @board.first_free
  end

  def turn_message
    "#{@name} is processing its move..."
  end
end
