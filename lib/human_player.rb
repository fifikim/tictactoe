# frozen_string_literal: true

require_relative 'player'
require_relative 'input'

class HumanPlayer < Player
  def select(*)
    Input.choose
  end

  def turn_message
    "#{@name}'s move:"
  end
end
