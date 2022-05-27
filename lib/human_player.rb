# frozen_string_literal: true

require_relative 'player'
require_relative 'input'

class HumanPlayer < Player
  def select(*)
    Input.get
  end

  def turn_message
    "#{@name}'s move:"
  end
end
