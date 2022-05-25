# frozen_string_literal: true

class HumanPlayer < Player
  attr_reader :name, :marker

  def select(*)
    $stdin.gets
  end

  def turn_message
    "#{@name}'s move:"
  end
end
