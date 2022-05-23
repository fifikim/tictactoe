# frozen_string_literal: true

module WinFinder
  COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def game_won?(board, marker)
    COMBOS.any? { |combo| combo.all? { |index| board[index] == marker } }
  end
end
