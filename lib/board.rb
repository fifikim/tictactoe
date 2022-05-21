# frozen_string_literal: true

class Board
  attr_reader :spaces

  def initialize(spaces = (1..9).to_a)
    @spaces = spaces
  end

  def record_move(marker, index)
    spaces[index] = marker
  end

  def board_full?(player1_marker, player2_marker)
    @spaces.all? { |value| value == player1_marker || value == player2_marker }
  end

  def occupied?(index, player1_marker, player2_marker)
    @spaces[index] == player1_marker || @spaces[index] == player2_marker
  end
end
