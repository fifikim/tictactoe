# frozen_string_literal: true

class Input
  ## self.get_space
  def self.choose_space
    $stdin.gets.strip
  end

  ## self.get_option
  def self.choose_option
    selection = choose_space
    selection.to_i - 1
  end
end
