require_relative 'console'
require_relative 'board'
require_relative 'move'

class Turn
  attr_accessor :current_player, :board, :console

  def initialize(current_player, board, console)
    @current_player = current_player
    @board = board
    @console = console 
  end

  def take
    display_board
    display_prompt
    move
  end

  private

  def display_board
    console.print_board(board.spaces)
  end

  def display_prompt
    console.output("\nPlayer #{current_player}'s move:")
  end

  def move
    input = gets.strip
    move = Move.new(current_player, input, board)
    move.record
  end

end