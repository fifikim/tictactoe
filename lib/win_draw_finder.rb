# frozen_string_literal: true

module WinDrawFinder

  COMBOS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ]

  def check_over
    if game_won? 
      end_game
      @console.output("Game over! #{@current_player.name} wins!")
    elsif @board.board_full?(@current_player.marker, @next_player.marker)
      end_game
      @console.output("Game over! It's a draw!")
    else
      switch_player
    end
  end

  def game_won?
    COMBOS.any? { |combo| combo.all? { |index| @board.spaces[index] == @current_player.marker } }
  end
end
