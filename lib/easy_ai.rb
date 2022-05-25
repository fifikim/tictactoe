# frozen_string_literal: true

class EasyAiPlayer < Player
  attr_reader :name, :marker

  def select(board, markers)
    board.first_free(markers)
  end

  def turn_message
    "#{@name} is processing its move..."
  end
end
