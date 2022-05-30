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
    rows[0].map do |n|
      column = []
      while n <= @board_size
        column << n.to_i
        n += @line_length
      end
      column
    end
  end

  def diagonals
    n = 1
    first_diagonal = []
    while n <= @board_size
      first_diagonal << n.to_i
      n += @line_length + 1
    end

    n = @line_length
    second_diagonal = []
    while n < @board_size
      second_diagonal << n.to_i
      n += @line_length - 1
    end

    [first_diagonal, second_diagonal]
  end
end
