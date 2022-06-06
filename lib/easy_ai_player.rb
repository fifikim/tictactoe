# frozen_string_literal: true

require_relative 'player'

class EasyAiPlayer < Player
  def select(board, markers)
    board.first_free(markers)
  end

  def turn_message
    'turn.easy_ai'
  end
end
