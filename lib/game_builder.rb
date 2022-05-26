# frozen_string_literal: true

require_relative 'game'

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

  def board(board)
    @game.board = board
  end

  def markers(markers)
    @game.markers = markers
  end

  def players(players)
    @game.current_player = players.initial_order[0]
    @game.next_player = players.initial_order[1]
  end

  def console(console)
    @game.console = console
  end
end
