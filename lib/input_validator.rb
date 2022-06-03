# frozen_string_literal: true

module InputValidator
  def self.invalid_selection?(board_size, input)
    !(1..board_size).include? input.to_i
  end
end
