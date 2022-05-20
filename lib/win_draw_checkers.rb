module WinDrawCheckers
  def COMBOS
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
  end

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