# frozen_string_literal: true

module WinDrawCheckers
  def check_over
    if game_won? @current_player.mark
      end_game
      @console.output("Game over! #{@current_player.name} wins!")
    elsif board_full?
      end_game
      @console.output("Game over! It's a draw!")
    else
      switch_player
    end
  end

  def game_won?(player_mark)
    @combinations.any? { |combo| combo.all? { |index| @board.spaces[index] == player_mark } }
  end

  def board_full?
    @board.spaces.none? { |value| value.is_a? Integer }
  end
end
