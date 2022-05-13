# frozen_string_literal: true

class Board
  attr_accessor :spaces

  def initialize(spaces = (1..9).to_a)
    @spaces = spaces
  end

  def draw
    " #{spaces[0]} | #{spaces[1]} | #{spaces[2]}\n" \
      "---|---|---\n" \
      " #{spaces[3]} | #{spaces[4]} | #{spaces[5]}\n" \
      "---|---|---\n" \
      " #{spaces[6]} | #{spaces[7]} | #{spaces[8]}\n"
  end

  def record_move(player, chosen_space)
    spaces[chosen_space - 1] = marker(player) 
  end

  private

  def marker(player)
    player == 1 ? "X" : "O"
  end
end