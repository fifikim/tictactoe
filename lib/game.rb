# frozen_string_literal: true

require_relative 'input_validator'
require_relative 'win_finder'

class Game
  attr_accessor :board, :current_player, :next_player, :markers, :console, :game_over

  def play
    take_turn until @game_over
  end

  private

  def initialize
    @game_over = false
  end

  def take_turn
    @console.board(@board)
    @console.output(@current_player.turn_message)
    select_space
    check_over
  end

  def select_space
    input = @current_player.select(@board, @markers)

    if InputValidator.invalid_selection? input
      @console.output('Invalid character! Please select an integer from 1-9:')
      select_space
    elsif @board.occupied_space?(input, @markers)
      @console.output('Invalid move! Please select a free space:')
      select_space
    end

    @board.record_move(@current_player.marker, input)
  end

  def check_over
    if WinFinder.game_won?(@board.spaces, @current_player.marker)
      end_game
      @console.output("Game over! #{@current_player.name} wins!")
    elsif @board.full?(@markers)
      end_game
      @console.output("Game over! It's a draw!")
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
