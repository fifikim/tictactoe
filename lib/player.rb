# frozen_string_literal: true

class Player
  attr_accessor :name, :marker

  def initialize(name = nil, marker = nil)
    @name = name
    @marker = marker
  end
end
