# frozen_string_literal: true

require_relative 'move'

class Game
  attr_accessor :board, :players, :console, :game_over

  def initialize(board, players, console)
    @board = board
    @players = players
    @console = console
    @game_over = false
  end

  def play
    take_turn until game_over
    console.output('Thanks for playing! Goodbye.')
  end

  private

  def current_player
    players.current_player
  end

  def take_turn
    move = Move.new(current_player, board, console)
    move.take
    check_over
  end

  def check_over
    if won?
      end_game
      console.output("Game over! Player #{current_player} wins!")
    elsif draw?
      end_game
      console.output("Game over! It's a draw!")
    else
      players.switch
    end
  end

  def won?
    player = current_player
    board.won?(player)
  end

  def draw?
    board.full?
  end

  def end_game
    @game_over = true
    console.board(board)
  end
end
