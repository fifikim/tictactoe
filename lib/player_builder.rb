# frozen_string_literal: true

require_relative 'easy_ai_player'
require_relative 'human_player'

class PlayerBuilder
  def self.build(name, marker)
    if name == 'Computer'
      EasyAiPlayer.new(name, marker)
    else
      HumanPlayer.new(name, marker)
    end
  end
end
