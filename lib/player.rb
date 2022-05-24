# frozen_string_literal: true

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def select(_marker)
    $stdin.gets
  end

  def turn_message
    "#{@name}'s move:"
  end
end
