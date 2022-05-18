# frozen_string_literal: true

class Board
  attr_reader :spaces

  def initialize(spaces = (1..9).to_a)
    @spaces = spaces
  end

  def record_move(marker, index)
    spaces[index] = marker
  end
end
