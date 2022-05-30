# frozen_string_literal: true

class InputValidator
  def initialize(board_size)
    @board_size = board_size
  end

  def invalid_selection?(input)
    !(1..@board_size).include? input.to_i
  end
end
