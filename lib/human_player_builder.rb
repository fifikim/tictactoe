# frozen_string_literal: true

require_relative 'human_player'
require_relative 'player_builder'

class HumanPlayerBuilder < PlayerBuilder
  def initialize
    super
    @player = HumanPlayer.new
  end
end
