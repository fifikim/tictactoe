# frozen_string_literal: true

require_relative 'turn'

class Game
  attr_accessor :board, :players, :current_player, :console

  def initialize(board, players, console)
    @board = board
    @players = players
    @console = console
  end

  def play
    until game_over?
      take_turn
    end
  end

  private

  def take_turn
    turn = Turn.new(current_player, board, console)
    turn.take
    players.switch
  end
  
  def current_player
    players.current_player
  end

  def game_over?
    false
  end
end
