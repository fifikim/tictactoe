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
    first_space = default_spaces.find { |space| !occupied_space?(space) }
    first_space.to_s
  end

  private

  def default_spaces
    (1..9).to_a
  end

  def convert_to_index(space)
    space.to_i - 1
  end
end
