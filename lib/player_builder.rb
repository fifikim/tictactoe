# frozen_string_literal: true

require_relative 'player'
require_relative 'easy_ai'

module PlayerBuilder
  def create_first_player(name)
    if ai_player? name
      EasyAiPlayer.new(name, 'X')
    else
      Player.new(name, 'X')
    end
  end

  def create_second_player(name)
    if ai_player? name
      EasyAiPlayer.new(name, 'O')
    else
      Player.new(name, 'O')
    end
  end

  private

  def ai_player?(name)
    name == 'Computer'
  end
end