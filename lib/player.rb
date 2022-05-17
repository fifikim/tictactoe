# frozen_string_literal: true

class Player
  attr_reader :name, :mark
  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def select_space
    selection = STDIN.gets
  end
end
