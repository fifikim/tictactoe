# frozen_string_literal: true

class EasyAiPlayer
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def select(board, markers)
    board.first_free(markers)
  end

  def turn_message
    "#{@name} is processing its move..."
  end
end
