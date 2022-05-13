# frozen_string_literal: true

class Players
  attr_accessor :current_player

  def initialize(current_player = 1)
    @current_player = current_player
  end

  def switch
    @current_player = current_player == 1 ? 2 : 1
  end
end
