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
  end

  private

  def current_player
    players.current_player
  end

  def take_turn
    console.board(board)
    move = Move.new(current_player, board, console)
    move.select_space
    check_over
  end

  def check_over
    if board.won? current_player
      end_game
      console.output("Game over! Player #{current_player} wins!")
    elsif board.full?
      end_game
      console.output("Game over! It's a draw!")
    else
      players.switch
    end
  end

  def end_game
    @game_over = true
    console.board(board)
  end
end
