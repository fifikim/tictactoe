# frozen_string_literal: true

class Players
  def initialize(player1, player2)
    @current_player = player1
    @next_player = player2
  end

  def initial_order
    [@current_player, @next_player]
  end
end
