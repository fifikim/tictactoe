# frozen_string_literal: true

class Game
  attr_accessor :board, :current_player, :next_player, :markers, :input_validator, :win_finder, :console, :game_over

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

    if @input_validator.invalid_selection? input
      @console.invalid_message
      select_space
    elsif @board.occupied_space?(input, @markers)
      @console.output('Invalid move! Please select a free space:')
      select_space
    else
      @board.record_move(@current_player.marker, input)
    end
  end

  def check_over
    if @win_finder.game_won?(@board.spaces, @current_player.marker)
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
