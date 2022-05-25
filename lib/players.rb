# frozen_string_literal: true

class Players
  def initialize(players)
    @first_player = players[0]
    @second_player = players[1]
  end

  def initial_order
    [@first_player, @second_player]
  end
end
