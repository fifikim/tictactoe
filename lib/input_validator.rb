# frozen_string_literal: true

module InputValidator
  def invalid_selection?(input)
    /^([1-9])$/.match(input).nil?
  end
end
