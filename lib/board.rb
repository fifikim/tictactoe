# frozen_string_literal: true

class Board
  attr_reader :spaces

  def initialize(markers, spaces = default_spaces)
    @markers = markers
    @spaces = spaces
  end

  def record_move(marker, selection)
    index = convert_to_index(selection)
    @spaces[index] = marker
  end

  def full?
    @spaces.all? { |value| occupied_space? value }
  end

  def occupied_space?(space)
    index = convert_to_index(space)
    @markers.any? { |marker| marker == @spaces[index] }
  end

  def first_free
    first_index = default_spaces.find_index { |space| !occupied_space?(space) }
    convert_to_space(first_index)
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
