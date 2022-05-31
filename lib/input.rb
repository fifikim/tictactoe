# frozen_string_literal: true

class Input
  def self.choose_space
    $stdin.gets.strip
  end

  def self.choose_option
    selection = choose_space
    selection.to_i - 1
  end
end
