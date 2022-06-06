# frozen_string_literal: true

require_relative 'input_validator'

class Game
  attr_accessor :board, :board_size, :current_player, :next_player, :markers, :win_finder, :console, :game_over

  def play
    @console.instructions(@current_player, @next_player)

    take_turn until @game_over
  end

  private

  def initialize
    @game_over = false
  end

  def take_turn
    @console.board(@board)
    @console.turn(@current_player.turn_message, @current_player.name)
    select_space
    check_over
  end

  def select_space
    input = @current_player.select(@board, @markers)

    if InputValidator.invalid_selection?(@board_size, input)
      @console.invalid
      select_space
    elsif @board.occupied_space?(input, @markers)
      @console.occupied
      select_space
    else
      @board.record_move(@current_player.marker, input)
    end
  end

  def check_over
    if @win_finder.game_won?(@board.spaces, @current_player.marker)
      end_game
      @console.win(@current_player.name)
    elsif @board.full?(@markers)
      end_game
      @console.draw
    else
      switch_player
    end
  end

  def switch_player
    @current_player, @next_player = @next_player, @current_player
  end

  def end_game
    @game_over = true
    @console.board(@board)
  end
end
