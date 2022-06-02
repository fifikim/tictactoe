# frozen_string_literal: true

require_relative 'game'
require_relative 'board'
require_relative 'game_console'
require_relative 'win_finder'

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

  def board(board_size)
    spaces = (1..board_size).to_a
    @game.board = Board.new(spaces)
    @game.board_size = board_size
    @game.win_finder = WinFinder.new(board_size)
    @game.console = GameConsole.new(board_size)
  end

  def players(players)
    @game.current_player = players.initial_order[0]
    @game.next_player = players.initial_order[1]
    @game.markers = [@game.current_player.marker, @game.next_player.marker]
  end
end
