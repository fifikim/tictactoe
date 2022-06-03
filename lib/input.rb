# frozen_string_literal: true

class Input
  def self.choose
    $stdin.gets.strip
  end

  def self.choose_option
    choose.to_i - 1
  end
end
