# frozen_string_literal: true

class InputValidator
  def self.invalid_selection?(input)
    /^([1-9])$/.match(input).nil?
  end
end
