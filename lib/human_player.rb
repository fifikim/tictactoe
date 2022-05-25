# frozen_string_literal: true

require_relative 'player'

class HumanPlayer < Player
  def select(*)
    $stdin.gets
  end

  def turn_message
    "#{@name}'s move:"
  end
end
