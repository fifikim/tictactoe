# frozen_string_literal: true

module InputValidator
  def validate_selection(selection)
    index = selection.to_i - 1

    if invalid? selection
      @console.output('Invalid character! Please select an integer from 1-9:')
      select_space
    elsif @board.occupied?(index, @current_player.marker, @next_player.marker)
      @console.output('Invalid move! Please select a free space:')
      select_space
    else
      @board.record_move(@current_player.marker, index)
    end
  end

  def invalid?(input)
    /^([1-9])$/.match(input).nil?
  end
end
