# frozen_string_literal: true

class Board
  attr_reader :spaces

  def initialize(spaces = (1..9).to_a)
    @spaces = spaces
  end

  def record_move(marker, selection)
    index = convert_to_index(selection)
    @spaces[index] = marker
  end

  def full?(markers)
    @spaces.all? { |value| occupied_space?(value, markers) }
  end

  def occupied_space?(space, markers)
    index = convert_to_index(space)
    markers.any? { |marker| marker == @spaces[index] }
  end

  def first_free(markers)
    index = @spaces.find_index { |space| !markers.include? space }
    convert_to_space(index)
  end

  private

  def default_spaces
    (1..9).to_a
  end

  def convert_to_index(space)
    space.to_i - 1
  end

  def convert_to_space(index)
    (index + 1).to_s
  end
end
