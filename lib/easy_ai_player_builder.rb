# frozen_string_literal: true

require_relative 'easy_ai_player'
require_relative 'player_builder'

class EasyAiPlayerBuilder < PlayerBuilder
  def initialize
    super
    @player = EasyAiPlayer.new
  end
end
