# frozen_string_literal: true

require_relative 'input_validator'
require_relative 'win_draw_finder'

class Game
  include InputValidator
  include WinDrawFinder

  def initialize(board, players, console)
    @board = board
    @current_player = players.initial_order[0]
    @next_player = players.initial_order[1]
    @console = console
    @game_over = false
  end

  def play
    take_turn until @game_over
  end

  private

  def take_turn
    @console.board(@board)
    @console.output(@current_player.turn_message)
    select_space
    check_over
  end

  def select_space
    input = @current_player.select
    validate_selection(input)
  end

  def switch_player
    @current_player, @next_player = @next_player, @current_player
  end

  def end_game
    @game_over = true
    @console.board(@board)
  end
end
