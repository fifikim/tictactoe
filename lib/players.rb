# frozen_string_literal: true

class Players
  def initialize(player1, player2)
    @first_player = player1
    @second_player = player2
  end

  def initial_order
    [@first_player, @second_player]
  end
end
