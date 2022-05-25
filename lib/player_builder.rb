# frozen_string_literal: true

require_relative 'player'

class PlayerBuilder
  attr_reader :player

  def self.build
    builder = new
    yield(builder)
    builder.player
  end

  def initialize
    @player = Player.new
  end

  def assign_name(name)
    @player.name = name
  end

  def assign_marker(marker)
    @player.marker = marker
  end
end
