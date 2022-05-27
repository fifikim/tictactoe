# frozen_string_literal: true

require_relative 'game'
require_relative 'board'

class GameBuilder
  attr_reader :game

  def self.build
    builder = new
    yield(builder)
    builder.game
  end

  def initialize
    @game = Game.new
  end

  def board
    @game.board = Board.new
  end

  def players(players)
    @game.current_player = players.initial_order[0]
    @game.next_player = players.initial_order[1]
    @game.markers = [@game.current_player.marker, @game.next_player.marker]
  end

  def console(console)
    @game.console = console
  end
end
