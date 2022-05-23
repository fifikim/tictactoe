# frozen_string_literal: true

class Board
  attr_reader :spaces

  def initialize(spaces = (1..9).to_a)
    @spaces = spaces
  end

  def record_move(marker, selection)
    index = convert(selection)
    @spaces[index] = marker
  end

  # def full?(player1_marker, player2_marker)
  #   @spaces.all? { |value| value == player1_marker || value == player2_marker }
  # end

  # def occupied?(selection, player1_marker, player2_marker)
  #   index = convert(selection)
  #   @spaces[index] == player1_marker || @spaces[index] == player2_marker
  # end

  def full?(player1_marker, player2_marker)
    @spaces.all? { |value| value == player1_marker || value == player2_marker }
  end

  def occupied?(selection, player1_marker, player2_marker)
    index = convert(selection)
    @spaces[index] == player1_marker || @spaces[index] == player2_marker
  end

  private

  def convert(selection)
    selection.to_i - 1
  end
end
