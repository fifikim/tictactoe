# frozen_string_literal: true

class Input
  def self.choose
    $stdin.gets.strip
  end

  def self.choose_option
    selection = choose
    selection.to_i - 1
  end
end
