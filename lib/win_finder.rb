# frozen_string_literal: true

class WinFinder
  def initialize(board_size)
    @board_size = board_size
    @line_length = Math.sqrt(board_size)
  end

  def game_won?(board, marker)
    combos.any? { |combo| combo.all? { |space| board[space - 1] == marker } }
  end

  private

  def combos
    rows.concat(columns).concat(diagonals)
  end

  def rows
    array = (1..@board_size).to_a
    array.each_slice(@line_length).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    first_diagonal = []
    space = 1
    while space <= @board_size
      first_diagonal << space.to_i
      space += @line_length + 1
    end

    second_diagonal = []
    space = @line_length
    while space < @board_size
      second_diagonal << space.to_i
      space += @line_length - 1
    end

    [first_diagonal, second_diagonal]
  end
end
