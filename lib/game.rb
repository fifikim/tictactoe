# frozen_string_literal: true

class Game
  attr_reader :current_player

  def initialize(board, players, console)
    @board = board
    @players = players
    @console = console
    @current_player = players.player1
    @game_over = false
  end

  def play
    take_turn until @game_over
  end

  def take_turn
    @console.board(@board)
    @console.output("\n#{@current_player.name}'s move:")
    get_input
    check_over
  end

  def check_over
    if @board.won? @current_player.mark
      end_game
      @console.output("Game over! #{current_player.name} wins!")
    elsif @board.full?
      end_game
      @console.output("Game over! It's a draw!")
    else
      switch_player
    end
  end

  def get_input
    input = @current_player.select_space
    validate_selection(input)
  end

  def validate_selection(selection)
    index = selection.to_i - 1

    if @board.invalid? selection
      @console.output("Invalid character! Please select an integer from 1-9:")
      get_input
    elsif @board.occupied? index
      @console.output("Invalid move! Please select a free space:")
      get_input
    else
      @board.record_move(@current_player.mark, index)
    end
  end

  def switch_player
    @current_player = current_player == @players.player1 ? @players.player2 : @players.player1
  end

  def end_game
    @game_over = true
    @console.board(@board)
  end

end
