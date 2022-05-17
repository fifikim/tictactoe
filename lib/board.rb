# frozen_string_literal: true

class Board
  attr_reader :spaces

  COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def initialize(spaces = (1..9).to_a)
    @spaces = spaces
  end

  def invalid?(input)
    /^([1-9])$/.match(input).nil?
  end

  def occupied?(index)
    !spaces[index].is_a? Integer
  end

  def record_move(marker, index)
    spaces[index] = marker
  end

  def won?(player)
    COMBOS.any? { |combo| combo.all? { |space| spaces[space] == player } }
  end

  def full?
    spaces.none? { |space| space.is_a? Integer }
  end
end
