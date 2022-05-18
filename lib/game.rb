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

  private

  def take_turn
    @console.board(@board)
    @console.output("\n#{@current_player.name}'s move:")
    select_space
    check_over
  end

  def select_space
    input = @current_player.select
    validate_selection(input)
  end

  def validate_selection(selection)
    index = selection.to_i - 1

    if @board.invalid? selection
      @console.output('Invalid character! Please select an integer from 1-9:')
      select_space
    elsif @board.occupied? index
      @console.output('Invalid move! Please select a free space:')
      select_space
    else
      @board.record_move(@current_player.mark, index)
    end
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

  def switch_player
    @current_player = current_player == @players.player1 ? @players.player2 : @players.player1
  end

  def end_game
    @game_over = true
    @console.board(@board)
  end
end
